import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listMeasurewifitable(query) {
  return request({
    url: '/system/measurewifitable/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getMeasurewifitable(measureWifiId) {
  return request({
    url: '/system/measurewifitable/' + measureWifiId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addMeasurewifitable(data) {
  return request({
    url: '/system/measurewifitable',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateMeasurewifitable(data) {
  return request({
    url: '/system/measurewifitable',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delMeasurewifitable(measureWifiId) {
  return request({
    url: '/system/measurewifitable/' + measureWifiId,
    method: 'delete'
  })
}
