<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');
if($do=='yangpian'){
	template('site/yangpian');
}elseif ($do=='xilie') {
	template('site/xilielist');
}elseif ($do=='deindex'){
	template('site/deindex');
}elseif ($do=='product'){
	template('site/product');
}elseif ($do=='about'){
	template('site/about');
}elseif($do=='product_detail'){
	template('site/product_detail');
}