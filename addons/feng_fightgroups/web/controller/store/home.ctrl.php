<?php 
/**
 * [weliam] Copyright (c) 2016/3/26
 * 商城首页自定义控制器
 */
defined('IN_IA') or exit('Access Denied');
wl_load()->model('page');
$op = in_array($op, array('design', 'display')) ? $op : 'display';
if ($op == 'display') {
		$page = pdo_fetch("select * from".tablename('tg_page'));
		if(empty($page)){
			$page['description'] = array(array('sort'=>"adv"),array('sort'=>"navigation"),array('sort'=>"search"),array('sort'=>"goods"));
		}else{
			$page['description'] = unserialize($page['description']);
		}
//		wl_debug($page);
		if(checksubmit()){
			$page_sort = $_GPC['sort'];
			$page_sort_on = $_GPC['on'];
			$pageedit = array();
			for($i=0;$i<count($page_sort);$i++){
					$pageedit[$i]['sort'] = $page_sort[$i];
					if(in_array($page_sort[$i], $page_sort_on)){
						$pageedit[$i]['on'] = 1;
					}else{
						$pageedit[$i]['on'] = 0;
					}
			}
//			wl_debug($pageedit);
			$pageedit = serialize($pageedit);
			$page = pdo_fetch("select * from".tablename('tg_page'));
			
			if(!empty($page)){
				pdo_update('tg_page',array('description'=>$pageedit),array('id'=>$page['id']));
			}else{
				pdo_insert('tg_page',array('description'=>$pageedit));
			}
			$page['description'] = unserialize($pageedit);
			message('页面保存成功.', web_url('store/home', array('id' => $id)), 'success');
		}
		include wl_template('store/home');
}
