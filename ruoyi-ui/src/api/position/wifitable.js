import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listWifitable(query) {
  return request({
    url: '/system/wifitable/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getWifitable(wiId) {
  return request({
    url: '/system/wifitable/' + wiId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addWifitable(data) {
  return request({
    url: '/system/wifitable',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateWifitable(data) {
  return request({
    url: '/system/wifitable',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delWifitable(wiId) {
  return request({
    url: '/system/wifitable/' + wiId,
    method: 'delete'
  })
}
