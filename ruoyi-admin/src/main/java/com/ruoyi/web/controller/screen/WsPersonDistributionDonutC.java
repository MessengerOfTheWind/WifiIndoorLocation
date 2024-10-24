/*
 * *
 *  * blog.coder4j.cn
 *  * Copyright (C) 2016-2019 All Rights Reserved.
 *
 */
package com.ruoyi.web.controller.screen;

import com.github.pagehelper.PageInfo;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.screen.poji.vo.PersonDistributionDonut;
import com.ruoyi.screen.service.IScreenMonitorService;
import com.ruoyi.web.controller.tool.Encoder.TableDataInfoEncoder;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.List;


/**
 * @author buhao
 * @version WsServerEndpoint.java, v 0.1 2019-10-18 16:06 buhao
 */
@ServerEndpoint(value = "/personDistributionDonutCWs",
        encoders = {TableDataInfoEncoder.class})
@Component
public class WsPersonDistributionDonutC {

    private IScreenMonitorService screenMonitorService;

    // 使用 Spring 上下文手动获取 Bean
    public WsPersonDistributionDonutC() {
        this.screenMonitorService = SpringUtils.getBean(IScreenMonitorService.class);
    }

    /**
     * 连接成功
     *
     * @param session
     */
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("连接成功");
    }

    /**
     * 连接关闭
     *
     * @param session
     */
    @OnClose
    public void onClose(Session session) {
        System.out.println("连接关闭");
    }

    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 接收到消息
     *
     * @param text
     */
    @OnMessage
    public void onMsg(String text, Session session) throws IOException, EncodeException {
        System.out.println("消息来了");
        List<PersonDistributionDonut> personDistributionDonutList = screenMonitorService.GetPersonDistributionDonut();
        TableDataInfo tableData = getDataTable(personDistributionDonutList);

        // 通过 session 发送 JSON 编码的 TableDataInfo 对象
        session.getBasicRemote().sendObject(tableData);
    }
}