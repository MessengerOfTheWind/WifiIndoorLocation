import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listAreatable(query) {
  return request({
    url: '/system/areatable/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getAreatable(areaId) {
  return request({
    url: '/system/areatable/' + areaId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addAreatable(data) {
  return request({
    url: '/system/areatable',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateAreatable(data) {
  return request({
    url: '/system/areatable',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delAreatable(areaId) {
  return request({
    url: '/system/areatable/' + areaId,
    method: 'delete'
  })
}
