<?php
/**
 * [weliam] Copyright (c) 2016/3/23
 * index.ctrl
 * 全部商品列表控制器
 */
defined('IN_IA') or exit('Access Denied');
wl_load()->model('adv');
wl_load()->model('goods');
wl_load()->model('merchant');
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
if($op =='display'){
	$pagetitle = !empty($config['tginfo']['sname']) ? '首页 - '.$config['tginfo']['sname'] : '首页';
	$cid = intval($_GPC['gid']);
	$advs = pdo_fetchall("select * from " . tablename('tg_adv') . " where enabled = 1 and uniacid = '{$_W['uniacid']}'");
	foreach ($advs as &$adv) {
		if (substr($adv['link'], 0, 5) != 'http:') {
			$adv['link'] = "http://" . $adv['link'];
		}
	}
//	wl_debug($advs);
	unset($adv);
	
	$category = pdo_fetchall("SELECT * FROM " . tablename('tg_category') . " WHERE uniacid = '{$_W['uniacid']}' and enabled=1 and parentid=0 ORDER BY parentid ASC, displayorder DESC");
	include wl_template('goods/goods_list');
}
if($op =='ajax'){
	$page = $_GPC['page'];
	$pagesize = $_GPC['pagesize'];
	$cid = intval($_GPC['cid']);
	$data = goods_get_list(array('usepage'=>1,'ishows'=>'1,3','page'=>$page,'pagesize'=>$pagesize,'cid' => $cid,'orderby' => 'ORDER BY displayorder DESC'));
	foreach ($data['list'] as $key => $value) {
		$params = pdo_fetchall("SELECT * FROM" . tablename('tg_goods_param') .  "WHERE goodsid = '{$value['id']}' limit 0,3 ");
		$data['list'][$key]['params'] = $params;
	}
	$goodses = $data;
	die(json_encode($goodses));
}
if($op =='search'){
	$keyword = $_GPC['keyword'];
	$goods = goods_get_list(array('gname'=>$keyword));
	include wl_template('goods/goods_list');
}
if($op =='merchant'){
	$id = $_GPC['id'];
	$merchant = merchant_get_by_params("id = {$id}");
	include wl_template('goods/merchant_goods');
}
if($op =='merchant_ajax'){
	$id = $_GPC['id'];//商家id
	$page = $_GPC['page'];
	$pagesize = $_GPC['pagesize'];
	$data = goods_get_list(array('usepage'=>1,'ishows'=>'1,3','page'=>$page,'pagesize'=>$pagesize,'merchantid' => $id,'orderby' => 'ORDER BY displayorder DESC'));
	foreach ($data['list'] as $key => $value) {
		$params = pdo_fetchall("SELECT * FROM" . tablename('tg_goods_param') .  "WHERE goodsid = '{$value['id']}' limit 0,3 ");
		$data['list'][$key]['params'] = $params;
	}
	$goodses = $data;
	die(json_encode($goodses));
}