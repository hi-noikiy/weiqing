<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');
if($do=='yangpian'){
	template('themes/moban2/yangpian');
}elseif ($do=='xilie') {
	template('themes/moban2/xilielist');
}elseif ($do=='deindex'){
	$multiid = intval($_GPC['t']);
	if(empty($multiid)) {
		load()->model('account');
		$setting = uni_setting($_W['uniacid'], array('default_site'));
		$multiid = $setting['default_site'];
	}
	$navs = app_navs('home', $multiid,0,$_GPC['styleid']);
	template('themes/moban2/deindex');
}elseif ($do=='product'){
	template('themes/moban2/product');
}elseif ($do=='about'){
	template('themes/moban2/about');
}elseif($do=='product_detail'){
	template('themes/moban2/product_detail');
}