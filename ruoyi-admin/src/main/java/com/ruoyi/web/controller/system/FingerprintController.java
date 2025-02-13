package com.ruoyi.web.controller.system;


import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.Aptable;
import com.ruoyi.system.domain.UserLocation;
import com.ruoyi.system.domain.view.Finger;
import com.ruoyi.system.domain.view.UserWifiRssi;
import com.ruoyi.system.domain.view.WifiView;
import com.ruoyi.system.service.IAptableService;
import com.ruoyi.system.service.IFingerprintService;
import com.ruoyi.system.service.IUserLocationService;
import com.ruoyi.web.controller.tool.KNNAlgorithm.Cal;
import com.ruoyi.web.controller.tool.spearmanr.Fingerprint;
import com.ruoyi.web.controller.tool.spearmanr.WifiFingerprintLocalization;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Api("wifi指纹信息管理")
@RestController
@RequestMapping("/system/fingerprint/")
public class FingerprintController extends BaseController {

    @Autowired
    private IFingerprintService fingerprintService;

    @Autowired
    private IAptableService aptableService;

    @Autowired
    private IUserLocationService userLocationService;


    @ApiOperation("获取定位信息")
//    @PreAuthorize("@ss.hasPermi('system:fingerprint:list')")
    @PostMapping("/LocationGet")
    public AjaxResult getFinger(@RequestBody UserWifiRssi userWifiRssi)
    {
        logger.info("userWifiRssi="+userWifiRssi.toString());
        String predictionLocation = userLocationService.computeUserLocation(userWifiRssi);
        return new AjaxResult(1, predictionLocation);
    }

    @ApiOperation("新获取定位信息")
    @PostMapping("/LocationGetNew")
    public AjaxResult getFingerNew(@RequestBody UserWifiRssi userWifiRssi)
    {

        Long areaId = 48L;
        // 判断当前用户属于哪个位置，目前我们假定就在区域1，区域1的id是37,获取当前位置下的apList
        List<Aptable> aptableList = aptableService.selectAptableList(new Aptable(areaId));
        String user = userWifiRssi.getUser();
        List<UserWifiRssi.WifiRssi> wifiRssiList = userWifiRssi.getWifiRssiList();

        // 给wifiRssiList用筛选，只留下在区域1中有的ap的信号值
        List<UserWifiRssi.WifiRssi> exitedWifiRssiList  = wifiRssiList.stream()
                .filter(itemA -> aptableList.stream()
                        .anyMatch(itemB -> itemB.getApName().equals(itemA.getApName())))
                .collect(Collectors.toList());
        // 处理数据使得数据唯一
        List<UserWifiRssi.WifiRssi> processedList = exitedWifiRssiList.stream()
                .collect(Collectors.groupingBy(
                        UserWifiRssi.WifiRssi::getApName,           // 按 apName 分组
                        Collectors.averagingInt(UserWifiRssi.WifiRssi::getRssi) // 计算每组 RSSI 的平均值
                ))
                .entrySet().stream()
                .map(entry -> new UserWifiRssi.WifiRssi(entry.getKey(), (int) Math.round(entry.getValue())))
                .collect(Collectors.toList());
        System.out.println(processedList.toString());
        // 打印结果
        processedList.forEach(System.out::println);
        logger.info("testList="+exitedWifiRssiList.toString());
        // 将exitedWifiRssiList依照同等的排序方式排序,保证一一对应关系
        Collections.sort(processedList, new Comparator<UserWifiRssi.WifiRssi>() {
            @Override
            public int compare(UserWifiRssi.WifiRssi item1, UserWifiRssi.WifiRssi item2) {
                return item2.getApName().compareTo(item1.getApName());
            }
        });

        // 这里需要校验exitedWifiRssiList的正确性，暂时省略

        // 对比的rssi信号
        List<Integer> compareRssi = new ArrayList<>();
        for (UserWifiRssi.WifiRssi r:processedList
        ) {
            compareRssi.add(r.getRssi());
        }
        String wifiAreaName = "新wifi测量区域";
        List<WifiView> list = (ArrayList<WifiView>) fingerprintService.selectFingerprintList(new WifiView(wifiAreaName));
        System.out.println(list.size());
        // 按照category和type分类
        Map<String, Map<Double, Map<Double, Map<Double, List<WifiView>>>>> classifiedItems = list.stream()
                .collect(Collectors.groupingBy(WifiView::getAreaName,
                        Collectors.groupingBy(WifiView::getPoX,
                                Collectors.groupingBy(WifiView::getPoY,
                                        Collectors.groupingBy(WifiView::getPoZ)))));

        // 指纹对比库集合，形如{areaName='区域1', XYZ='6.0, 1.0, 1.0', rssiList = [-43,-51,-52,-47]
        List<Finger> fingerList = new ArrayList<>();
        // 输出分类结果
        System.out.println(classifiedItems);
        classifiedItems.forEach((category, typeMap) -> {
            typeMap.forEach((type, brandMap) -> {
                brandMap.forEach((brand, modelMap) -> {
                    modelMap.forEach((model, itemList) -> {
                        // 针对itemList进行排序
                        Collections.sort(itemList, new Comparator<WifiView>() {
                            @Override
                            public int compare(WifiView item1, WifiView item2) {
                                return item2.getApName().compareTo(item1.getApName());
                            }
                        });

                        // 创建对比的finger
                        String baseInfoLocation = itemList.get(0).LocationToString();
                        Finger finger = new Finger(itemList.get(0).getAreaName(),baseInfoLocation);
                        List<Integer> rssi = new ArrayList<>();
                        for (WifiView i:itemList
                        ) {
                            rssi.add(i.getWiRssi());
                        }
                        finger.setRssiList(rssi);
                        fingerList.add(finger);

                        System.out.println(finger);
                    });
                });
            });
            System.out.println(fingerList);
        });
//        String predictionLocation = Cal.cal(fingerList, compareRssi);
        List<Fingerprint> fingerprintDatabase = new ArrayList<>();
        for (Finger f:fingerList
             ) {

            double[] RssiList = f.getRssiList().stream()
                    .mapToDouble(Integer::doubleValue)
                    .toArray();
            String location = f.getXYZ();
            Fingerprint fingerprint = new Fingerprint(RssiList, location);
            fingerprintDatabase.add(fingerprint);
        }
        double[] givenRssi = compareRssi.stream()
                .mapToDouble(Integer::doubleValue)
                .toArray();
//        logger.info("givenRssi length ="+String.valueOf(givenRssi.length));
        String predictionLocation = WifiFingerprintLocalization.speGetLocation(fingerprintDatabase, givenRssi);
        UserLocation userLocation = new UserLocation(userWifiRssi.getUser(),37L,predictionLocation);

        userLocationService.insertUserLocation(userLocation);
        return new AjaxResult(1, predictionLocation);
    }


    /**
     * 查询【wifi指纹】列表
     */
    @ApiOperation("获取wifi指纹列表")
//    @PreAuthorize("@ss.hasPermi('system:fingerprint:list')")
    @GetMapping("/list")
    public TableDataInfo list(WifiView wifiView)
    {
//        startPage();
        List<WifiView> list = (ArrayList<WifiView>) fingerprintService.selectFingerprintList(wifiView);
        System.out.println(list.size());
        // 按照category和type分类
        Map<String, Map<Double, Map<Double, Map<Double, List<WifiView>>>>> classifiedItems = list.stream()
                .collect(Collectors.groupingBy(WifiView::getAreaName,
                        Collectors.groupingBy(WifiView::getPoX,
                                Collectors.groupingBy(WifiView::getPoY,
                                        Collectors.groupingBy(WifiView::getPoZ)))));

        // 指纹对比库集合，形如{areaName='区域1', XYZ='6.0, 1.0, 1.0', rssiList = [-43,-51,-52,-47]
        List<Finger> fingerList = new ArrayList<>();
        // 输出分类结果
        System.out.println(classifiedItems);
        classifiedItems.forEach((category, typeMap) -> {
            typeMap.forEach((type, brandMap) -> {
                brandMap.forEach((brand, modelMap) -> {
                    modelMap.forEach((model, itemList) -> {
                        // 针对itemList进行排序
                        Collections.sort(itemList, new Comparator<WifiView>() {
                            @Override
                            public int compare(WifiView item1, WifiView item2) {
                                return item2.getApName().compareTo(item1.getApName());
                            }
                        });

                        // 创建对比的finger
                        String baseInfoLocation = itemList.get(0).LocationToString();
                        Finger finger = new Finger(itemList.get(0).getAreaName(),baseInfoLocation);
                        List<Integer> rssi = new ArrayList<>();
                        for (WifiView i:itemList
                             ) {
                            rssi.add(i.getWiRssi());
                        }
                        finger.setRssiList(rssi);
                        fingerList.add(finger);

                        System.out.println(finger);
                    });
                });
            });
            System.out.println(fingerList);
        });

        return getDataTable(list);
    }

}
