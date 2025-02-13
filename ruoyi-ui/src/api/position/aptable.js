import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listAptable(query) {
  return request({
    url: '/system/aptable/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getAptable(apId) {
  return request({
    url: '/system/aptable/' + apId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addAptable(data) {
  return request({
    url: '/system/aptable',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateAptable(data) {
  return request({
    url: '/system/aptable',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delAptable(apId) {
  return request({
    url: '/system/aptable/' + apId,
    method: 'delete'
  })
}
