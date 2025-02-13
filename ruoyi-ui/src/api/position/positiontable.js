import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listPositiontable(query) {
  return request({
    url: '/system/positiontable/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getPositiontable(poId) {
  return request({
    url: '/system/positiontable/' + poId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addPositiontable(data) {
  return request({
    url: '/system/positiontable',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updatePositiontable(data) {
  return request({
    url: '/system/positiontable',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delPositiontable(poId) {
  return request({
    url: '/system/positiontable/' + poId,
    method: 'delete'
  })
}
