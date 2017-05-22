<?php
/**
 * 微网站模块微站定义
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');
class Htxy_swebModuleSite extends WeModuleSite {
	public $site = "htxy_sweb_site";
	public $article = "htxy_sweb_article";
	public $cate = "htxy_sweb_cate";
	public $order = "htxy_sweb_order";
	public $carousel = "htxy_sweb_carousel";
	public $website = "website";
	public $mess = "htxy_sweb_message";
	public $reply = "htxy_sweb_reply";
	public $user_reply = "htxy_sweb_user_reply";
	// 站点列表
	public function doWebSweb_man() {
		//这个操作被定义用来呈现 功能封面
		load()->func('tpl');
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->site));
		$pager = pagination($_total,$pindex,$psize);
		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->site) ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->site) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的项目
			$list = pdo_fetchall("SELECT * FROM " . tablename($this->site) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));

		}
		include $this->template('sweb_man');
	}
	// 栏目详情列表
	public function doWebSweb_article_list(){
		load()->func('tpl');
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->article));
		$pager = pagination($_total,$pindex,$psize);
		$cates=pdo_fetchall("SELECT * FROM".tablename($this->cate)."WHERE uniacid=:uniacid and is_show=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>1));

		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->article) ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->article) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的自家项目
			$list = pdo_fetchall("SELECT * FROM " . tablename($this->article) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));

		}
		// 判断是否有可显示的栏目存在
		if(empty($cates)){
			echo "<script>alert('请先添加栏目或修改状态');history.go(-1);</script>";
		}
		include $this->template('list');
	}
	//栏目详情添加
	public function doWebSweb_article(){
		global $_W,$_GPC;
		load()->func('tpl');
		$id=intval($_GPC['id']);
		$data['uniacid']=intval($_W['uniacid']);
		$data['article_name']=trim($_GPC['article_name']);
		$data['article_detail']=trim($_GPC['article_detail']);
		$data['uid']=intval($_W['uid']);
		$data['cate_id']=intval($_GPC['cate_id']);
		$data['is_show']=intval($_GPC['is_show']);
		$data['fee']=$_GPC['fee'];
		$data['is_pay']=intval($_GPC['is_pay']);
		$data['buy_num']=intval($_GPC['buy_num']);
		$data['active_start']=trim($_GPC['active']['start']);
		$data['active_end']=trim($_GPC['active']['end']);
		$data['back_music']=trim($_GPC['back_music']);
		$data['share_title']=trim($_GPC['share_title']);
		$data['share_pic']=trim($_GPC['share_pic']);
		$data['share_desc']=trim($_GPC['share_desc']);
		$data['create_time']=date("Y-m-d H:i:s");
		
		if(!empty($id)){
			$articles=pdo_fetch("SELECT * FROM ".tablename($this->article)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			$articles["article_detail"]=html_entity_decode($articles["article_detail"]);
			$caten=pdo_fetch("SELECT id,cate_name FROM".tablename($this->cate)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$articles['cate_id'],":uniacid"=>$articles['uniacid']));
		}
		
		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果用的是智诚的公众号
				if($_W['role']=="operator"){
					// 如果是操作员的权限那就之只能操作自己添加的项目
					$cates=pdo_fetchall("SELECT * FROM".tablename($this->cate)."WHERE uniacid=:uniacid and is_show=:is_show and uid=:uid",array(':uniacid'=>$_W['uniacid'],':is_show'=>1,':uid'=>$_W['uid']));
					
				}else{
					// 如果是管理员的话可以看到所有的项目
					$cates=pdo_fetchall("SELECT * FROM".tablename($this->cate)."WHERE uniacid=:uniacid and is_show=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>1));
					
				}
			}else{
				// 如果是用的自家的公众号可以查看所得站点
				$cates=pdo_fetchall("SELECT * FROM".tablename($this->cate)."WHERE uniacid=:uniacid and is_show=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>1));
				
			}





		$url=$this->createWebUrl('Sweb_article_list');
		if(empty($id)){
				// 添加操作
			if(checksubmit('submit')){ 
				if(empty($_GPC['cate_id'])){
					echo "<script>alert('请先选择栏目');history.go(-1)</script>";die;
				}
				$lenth=strlen($_GPC['article_name']);
				if($lenth>60){
					echo "<script>alert('栏目标题过长请精简添加');history.go(-1)</script>";die;
				}
				$sh_ti=strlen($_GPC['share_title']);
				if($lenth>90){
					echo "<script>alert('分享标题过长请精简添加');history.go(-1)</script>";die;
				}

				$result=pdo_insert($this->article,$data);
				if($result){
					message('项目添加成功',$url,"success");
				}else{
					message('项目添加失败',$url,"error");
				}
			}	
		}else{
				if(checksubmit('submit')){
					if(empty($_GPC['cate_id'])){
						echo "<script>alert('请先选择栏目');history.go(-1)</script>";die;

					}
					$lenth=strlen($_GPC['article_name']);
					if($lenth>20){
						echo "<script>alert('栏目标题过长请精简添加');history.go(-1)</script>";die;
					}
					$sh_ti=strlen($_GPC['share_title']);
					if($lenth>30){
						echo "<script>alert('分享标题过长请精简添加');history.go(-1)</script>";die;
					}
				// 修改操作
				$param=array('id'=>$id,'uniacid'=>$_W['uniacid'],'uid'=>$_W['uid']);
				$result=pdo_update($this->article,$data,$param);

				if($result){
					message('项目编辑成功',$url,"success");
				}else{
					message('项目编辑失败',$url,"error");
				}	

			}
		}
		// var_dump($caten);die;
		include $this->template('sweb_article');
	}
	//详细内容删除
	public function doWebAtri_delete(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		if($_W['role']=="operator"){
				$del=pdo_query("DELETE FROM ".tablename($this->article)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$del=pdo_query("DELETE FROM ".tablename($this->article)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			}
			$url=$this->createWebUrl('Sweb_article_list');
			
			if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
	}
	// 栏目列表
	public function doWebSweb_cate() {
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename('htxy_sweb_cate') );
		$pager = pagination($_total,$pindex,$psize);

		// 站点的查询
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果用的是智诚的公众号
				if($_W['role']=="operator"){
					// 如果是操作员的权限那就之只能操作自己添加的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and uid=:uid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid'],':is_show'=>0));
				}else{
					// 如果是管理员的话可以看到所有的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
				}
			}else{
				// 如果是用的自家的公众号可以查看所得站点
				$sites=pdo_fetchall('SELECT id,sitename FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
			}
			// 根据不同绝肃查询出不同栏目
		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){

			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename('htxy_sweb_cate') ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename('htxy_sweb_cate') ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的项目
			$list = pdo_fetchall("SELECT * FROM " . tablename('htxy_sweb_cate') ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));

		}
		if(empty($sites)){
			echo "<script>alert('请先添加站点或修改站点状态');history.go(-1);</script>";
		}
		include $this->template('cate_list');
	}
	// 栏目添加和编辑
	public function doWebAdd_cate() {
		// load()->func('tpl');
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$data['uniacid']=intval($_W['uniacid']);
		$data['cate_pic']=trim($_GPC['cate_pic']);
		$data['cate_name']=trim($_GPC['cate_name']);
		$data['site_id']=intval($_GPC['site_id']);
		$data['is_show']=intval($_GPC['is_show']);
		$data['uid']=intval($_W['uid']);
		$data['create_time']=date('Y-m-d H:i:s');

		// 站点的查询
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果用的是智诚的公众号
				if($_W['role']=="operator"){
					// 如果是操作员的权限那就之只能操作自己添加的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and uid=:uid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid'],':is_show'=>0));
				}else{
					// 如果是管理员的话可以看到所有的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
				}
			}else{
				// 如果是用的自家的公众号可以查看所得站点
				$sites=pdo_fetchall('SELECT id,sitename FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
			}
		if($id){

			if(checksubmit('submit')){ 
				// 更新操作
				$res = pdo_update($this->cate, $data, array('id' =>$id));
				if (!empty($res)) {
				    $url=$this->createWebUrl('add_cate',array('id'=>$id));
				    message('更新成功',$url,"success");
				}
			}else{
				// 保存完后以及要编辑页面的数据的查询
				$cates=pdo_fetch('SELECT * FROM'.tablename($this->cate)."WHERE `id`=:id and `uniacid`=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
				// 查询要编辑的站点名
				$siten=pdo_fetch('SELECT id,sitename FROM'.tablename($this->site)."WHERE `id`=:id and `uniacid`=:uniacid",array(':id'=>$cates['site_id'],':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 添加操作
			if(checksubmit('submit')){
				$res=pdo_insert($this->cate,$data);
				if (!empty($res)) {
				    $id = pdo_insertid();
				    $url=$this->createWebUrl('add_cate',array('id'=>$id));
				    message('添加成功',$url,"success");
				}
			
			}
		}
		

		include $this->template('add_cate');
	}
	//栏目的删除
	public function doWebDelete_cate(){
		global $_W,$_GPC;
		$id=$_GPC['id'];
		// if(is_array($id)){

		// }
		if($_W['role']=="operator"){
			$del=pdo_query("DELETE FROM ".tablename('htxy_sweb_cate')." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
		}else{
			$del=pdo_query("DELETE FROM ".tablename('htxy_sweb_cate')." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
		}
		$url=$this->createWebUrl('sweb_cate');
		if(!empty($del)){
			message('删除成功',$url,"success");
		}else{
			message('删除失败',$url,"error");
		}
	}
	//站点的删除
	public function doWebDelete_site(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		// if(is_array($id)){

		// }
		$rid = intval($_GPC['rid']);
        $rule = pdo_fetch("SELECT id, module FROM " . tablename('rule') . " WHERE id = :id and uniacid=:weid", array(':id' => $rid, ':weid' => $_W['weid']));
        if (empty($rule)) {
            message('抱歉，要修改的规则不存在或是已经被删除！');
        }
        if (pdo_delete('rule', array('id' => $rid))) {
            pdo_delete('rule_keyword', array('rid' => $rid));
            //删除统计相关数据
            pdo_delete('stat_rule', array('rid' => $rid));
            pdo_delete('stat_keyword', array('rid' => $rid));
            //调用模块中的删除
            $module = WeUtility::createModule($rule['module']);
            if (method_exists($module, 'ruleDeleted')) {
                $module->ruleDeleted($rid);
            }
			if($_W['role']=="operator"){
				$del=pdo_query("DELETE FROM ".tablename($this->site)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$del=pdo_query("DELETE FROM ".tablename($this->site)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
			}
			$url=$this->createWebUrl('sweb_man');
			
			if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
        }
	}
	// 轮播图列表页
	public function doWebSweb_carousel() {
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->carousel));
		$pager = pagination($_total,$pindex,$psize);
		// 站点的查询
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果用的是智诚的公众号
				if($_W['role']=="operator"){
					// 如果是操作员的权限那就之只能操作自己添加的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and uid=:uid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid'],':is_show'=>0));
				}else{
					// 如果是管理员的话可以看到所有的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
				}
			}else{
				// 如果是用的自家的公众号可以查看所得站点
				$sites=pdo_fetchall('SELECT id,sitename FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
			}	

		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->carousel) ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->carousel) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的自家项目
			$list = pdo_fetchall("SELECT * FROM " . tablename($this->carousel) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));

		}
		//判断是否要可以显示的站点
		if(empty($sites)){
			echo "<script>alert('请先添加站点或修改站点状态');history.go(-1);</script>";
		}
		include $this->template('carousel');
	}
	//添加轮播图
	public function doWebAdd_carousel(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$data['uniacid']=intval($_W['uniacid']);
		$data['carousel_pic']=trim($_GPC['carousel_pic']);
		$data['carousel_name']=trim($_GPC['carousel_name']);
		$data['site_id']=intval($_GPC['site_id']);
		$data['is_show']=intval($_GPC['is_show']);
		$data['uid']=intval($_W['uid']);
		$data['create_time']=date('Y-m-d H:i:s');
		// 站点的查询
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果用的是智诚的公众号
				if($_W['role']=="operator"){
					// 如果是操作员的权限那就之只能操作自己添加的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and uid=:uid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid'],':is_show'=>0));
				}else{
					// 如果是管理员的话可以看到所有的项目
					$sites=pdo_fetchall('SELECT id,sitename,uniacid FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
				}
			}else{
				// 如果是用的自家的公众号可以查看所得站点
				$sites=pdo_fetchall('SELECT id,sitename FROM'.tablename($this->site)."WHERE uniacid=:uniacid and is_show!=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>0));
			}

		if($id){
			
			if(checksubmit('submit')){ 
				if(empty($_GPC['carousel_name'])){
					echo "<script>alert('添加轮播名称');history.go(-1)</script>";
				}
				if(empty($_GPC['site_id'])){
					echo "<script>alert('请选择站点');history.go(-1)</script>";
				}
				if(empty($_GPC['carousel_pic'])){
					echo "<script>alert('请添加轮播图片');history.go(-1)</script>";
				}
				// 更新操作
				$res = pdo_update($this->carousel, $data, array('id' =>$id));
				if (!empty($res)) {
				    $url=$this->createWebUrl('add_carousel',array('id'=>$id));
				    message('更新成功',$url,"success");
				}
			}else{
				// 保存完后以及要编辑页面的数据的查询
				$carsouels=pdo_fetch('SELECT * FROM'.tablename($this->carousel)."WHERE `id`=:id and `uniacid`=:uniacid",array(':id'=>$id,':uniacid'=>$_W['uniacid']));
				// 查询要编辑的站点名
				$siten=pdo_fetch('SELECT id,sitename FROM'.tablename($this->site)."WHERE `id`=:id and `uniacid`=:uniacid",array(':id'=>$carsouels['site_id'],':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 添加操作
			if(checksubmit('submit')){
				if(empty($_GPC['carousel_name'])){
					echo "<script>alert('添加轮播名称');history.go(-1)</script>";
				}
				if(empty($_GPC['site_id'])){
					echo "<script>alert('请选择站点');history.go(-1)</script>";
				}
				if(empty($_GPC['carousel_pic'])){
					echo "<script>alert('请添加轮播图片');history.go(-1)</script>";
				}
				$res=pdo_insert($this->carousel,$data);
				if (!empty($res)) {
				    $id = pdo_insertid();
				    $url=$this->createWebUrl('add_carousel',array('id'=>$id));
				    message('添加成功',$url,"success");
				}
			
			}
		}
		include $this->template('add_carousel');
	}
	//轮播图删除
	public function doWebcarousel_delete(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		if($_W['role']=="operator"){
			$del=pdo_query("DELETE FROM ".tablename($this->carousel)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
		}else{
			$del=pdo_query("DELETE FROM ".tablename($this->carousel)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
		}
		$url=$this->createWebUrl('sweb_carousel');

		if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
	}
	// 订单列表
	public function  doWebSweb_order () {
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		
		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->order) ." WHERE uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
				$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->order)."WHERE uniacid=:uniacid and uid=:uid",array(':uniacid'=>$_W['uniacid'],":uid"=>$_W['uid']));
				$pager = pagination($_total,$pindex,$psize);
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->order) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
				$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->order));
				$pager = pagination($_total,$pindex,$psize);
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的自家项目
			$list = pdo_fetchall("SELECT * FROM " . tablename($this->order) ." WHERE uniacid=:uniacid LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->order));
			$pager = pagination($_total,$pindex,$psize);
		}
		
		include $this->template('order_list');
	}
	// 订单详情
	public function doWebOrder_detail(){
		global $_W,$_GPC;
		echo "<pre>";
		var_dump($_GPC);
	}
	
	// 传过来的支付数据
	public function  doMobilePay_order () {
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$uniacid=intval($_GPC['i']);
		$nums=intval($_GPC['nums']);
		$price=floatval($_GPC['price']);
		if($price<=0){
			message('商品金额不正确请重新购买','',"error");
		}
		$result=pdo_fetch("SELECT id,article_name,fee,buy_num,cate_id FROM".tablename($this->article)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$id,':uniacid'=>$uniacid));
		if($nums>$result['buy_num']){
			message('您的购买数量超出了限定数量','',"error");
		}
		$site_id=pdo_fetch("SELECT id,site_id FROM".tablename($this->cate)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$result['cate_id'],':uniacid'=>$uniacid));
		$sitename=pdo_fetch("SELECT id,sitename FROM".tablename($this->site)."WHERE id=:id and uniacid=:uniacid",array(':id'=>$site_id['site_id'],':uniacid'=>$uniacid));
		

		// 对于总数量的判断
		$order_nums=pdo_fetchall("SELECT nums FROM".tablename($this->order)."WHERE owner_openid=:openid and uniacid=:uniacid and article_id=:article_id and order_status=:order_status",array(':article_id'=>$id,":openid"=>$_W['openid'],":uniacid"=>$uniacid,":order_status"=>1));
		$total_n=0;
		if(is_array($order_nums)){
			foreach ($order_nums as $v) {
				if(is_array($v)){
					foreach ($v as $v1) {
						$total_n+=$v1;
						
					}
				}else{
					$total_n+=$v;
				}
			}
		}else{
			$total_n+=$order_nums;
		}
		if($total_n>$result['buy_num']){
			message('您购买的总数量超出了限定数量','',"error");
		}
		// 随机产生的订单号
		$numbers = range (0,9);
		shuffle ($numbers);
		$num=6;
		$res = array_slice($numbers,0,$num); 
		$re=implode("",$res);
		$order_number=date("YmdHis").$re; //显示的订单号
		$tid=date("mdHis");
		// 对于总价的判断
		$total_p=$nums*$result['fee'];
		$price=$total_p?$total_p:$price;
		// 查询是否有未支付的订单
		// $opk=pdo_fetch("SELECT id,price,nums FROM".tablename($this->order)."WHERE order_name=:order_name and owner_name=:owner_name and owner_phone=:owner_phone and owner_openid=:owner_openid and order_status=:order_status and article_id=:article_id",array(':article_id'=>$result['id'],':order_name'=>$result['article_name'],':owner_name'=>$_GPC['name'],':owner_phone'=>$_GPC['phone'],':owner_openid'=>$_W['openid'],':order_status'=>0));
		
		// 添加到订单表的数据
		$order_data['owner_name']=trim($_GPC['name']);
		$order_data['owner_phone']=trim($_GPC['phone']);
		$order_data['order_name']=trim($result['article_name']);
		$order_data['article_id']=trim($id);
		$order_data['order_number']=trim($tid);
		$order_data['uniacid']=$uniacid;
		$order_data['uid']=$_W['uid'];
		$order_data['fee']=$result['fee'];
		$order_data['price']=$price;
		$order_data['nums']=$nums;
		$order_data['owner_openid']=$_W['openid'];
		$order_data['sitename']=$sitename['sitename'];
		$order_data['create_time']=date("Y-m-d H:i:s");
		$order_result = pdo_insert($this->order, $order_data);
		if(!empty($order_result)){
			$params = array(
	        'tid' => $tid,      //充值模块中的订单号，此号码用于业务模块中区分订单，交易的识别码
	        'ordersn' => $order_number,  //收银台中显示的订单号
	        'title' => $result['article_name'],          //收银台中显示的标题
	        'fee' => $price,      //收银台中显示需要支付的金额,只能大于 0
	        // 'user' => $_W['member']['uid'],     //付款用户, 付款的用户名(选填项)
	    	
	    	);
		 	$this->pay($params);
		}else{
			message('参数错误请重新选择','',"error");

		}
	}
	// 支付后的回调
	public function payResult($params) {
		    //一些业务代码
		    //根据参数params中的result来判断支付是否成功
		    if ($params['result'] == 'success' && $params['from'] == 'notify') {
		        //此处会处理一些支付成功的业务代码
		        pdo_update($this->order,array('order_status'=>1),array('order_number'=>$params['tid']));
		    }
		    //因为支付完成通知有两种方式 notify，return,notify为后台通知,return为前台通知，需要给用户展示提示信息
		    //return做为通知是不稳定的，用户很可能直接关闭页面，所以状态变更以notify为准
		    //如果消息是用户直接返回（非通知），则提示一个付款成功
		    if ($params['from'] == 'return') {
		        if ($params['result'] == 'success') {
		            message('支付成功！', '', 'success');
		        } else {
		            message('支付失败！','', 'error');
		        }
		    }
	}
	//留言板
	public function doWebSweb_mess(){
		load()->func('tpl');
		global $_W,$_GPC;
		$p = isset($_GPC['page']) ? $_GPC['page'] : 1;
		$pindex = max(1,intval($p));
		$psize = 10;
		$_total = pdo_fetchcolumn("SELECT count(*) FROM ". tablename($this->mess));
		$pager = pagination($_total,$pindex,$psize);
		// $cates=pdo_fetchall("SELECT * FROM".tablename($this->cate)."WHERE uniacid=:uniacid and is_show=:is_show",array(':uniacid'=>$_W['uniacid'],':is_show'=>1));

		if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
			// 如果是智诚自家的公众号的话分管理员和操作员查询
			if($_W['role']=="operator"){
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->mess) ." WHERE uniacid=:uniacid and uid=:uid ORDER BY create_time DESC LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
			}else{
				$list = pdo_fetchall("SELECT * FROM " . tablename($this->mess) ."WHERE uniacid=:uniacid ORDER BY create_time DESC LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));
			}
		}else{
			// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的自家留言
			$list = pdo_fetchall("SELECT * FROM " . tablename($this->mess) ." WHERE uniacid=:uniacid ORDER BY create_time DESC LIMIT ".($pindex-1)*$psize.",".$psize,array(':uniacid'=>$_W['uniacid']));

		}
		foreach ($list as $k=>$v) {
			$site[]=$v['site_id'];
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				// 如果是智诚自家的公众号的话分管理员和操作员查询
				if($_W['role']=="operator"){
					$sites = pdo_fetch("SELECT sitename FROM " . tablename($this->site) ." WHERE id=:id and uniacid=:uniacid and uid=:uid LIMIT ".($pindex-1)*$psize.",".$psize,array(':id'=>$v['site_id'],':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
				}else{
					$sites = pdo_fetch("SELECT sitename FROM " . tablename($this->site) ."WHERE id=:id and uniacid=:uniacid ORDER BY create_time DESC LIMIT ".($pindex-1)*$psize.",".$psize,array(':id'=>$v['site_id'],':uniacid'=>$_W['uniacid']));
				}
			}else{
				// 不是智诚自家的公众号的话管理员和操作员都可以查看到所有的自家留言
				$sites = pdo_fetch("SELECT sitename FROM " . tablename($this->site) ." WHERE id=:id and uniacid=:uniacid ORDER BY create_time DESC LIMIT ".($pindex-1)*$psize.",".$psize,array(':id'=>$v['site_id'],':uniacid'=>$_W['uniacid']));

			}
			$list[$k]['site']=$sites['sitename'];

		}
		include $this->template('mess_list');
	}
	//留言板查看详情
	public function doWebMess_detail(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$site_id=intval($_GPC['site_id']);
			if($_W['uniacid']==6 or $_W['uniacid']==3 or $_W['uniacid']==4 or $_W['uniacid']==21){
				if($_W['role']=="operator"){
					$messages=pdo_fetch("SELECT * FROM".tablename($this->mess)." WHERE id=:id and uid=:uid and uniacid=:uniacid and site_id=:site_id", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid'],':site_id'=>$site_id));
				}else{
					$messages=pdo_fetch("SELECT * FROM".tablename($this->mess)." WHERE id=:id and uniacid=:uniacid and site_id=:site_id", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':site_id'=>$site_id));
				}
			}else{
				$messages=pdo_fetch("SELECT * FROM".tablename($this->mess)." WHERE id=:id and uniacid=:uniacid and site_id=:site_id", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':site_id'=>$site_id));

			}
			//查看回复的留言
			$reply_mess=pdo_fetchall("SELECT * FROM".tablename($this->reply)."WHERE reply_mess_id=:reply_mess_id and uniacid=:uniacid  and site_id=:site_id",array(':reply_mess_id'=>$id,":uniacid"=>$_W['uniacid'],':site_id'=>$site_id));
			foreach ($reply_mess as $k=> $v) {
			
				$u_reply=pdo_fetchall("SELECT * FROM".tablename($this->user_reply)."WHERE user_reply_mess_id=:user_reply_mess_id and uniacid=:uniacid and site_id=:site_id",array(':user_reply_mess_id'=>$v['reply_mess_id'],':uniacid'=>$v['uniacid'],':site_id'=>$v['site_id']));
			}
		include $this->template('mess_reply');

	}
	
	//管理员回复的留言
	public function doWebAdd_reply(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		$site_id=intval($_GPC['site_id']);
		$content=trim($_GPC['content']);
		$data['uniacid']=$_W['uniacid'];
		$data['site_id']=$site_id;
		$data['reply_message']=$content;
		$data['reply_openid']="管理员回复";
		$data['reply_mess_id']=$id;
		$data['manager_headerurl']="1231231231";
		$data['create_time']=date("Y-m-d H:i:s");
		if($_GPC['action']=="add_reply"){
				$result=pdo_insert($this->reply,$data);
			if($result){
				$reback=array('info'=>"回复成功",'status'=>1);
			}else{
				$reback=array('info'=>"回复失败",'status'=>2);

			}

		}else{
			$reback=array('info'=>"参数错误",'status'=>0);
		}
		exit(json_encode($reback));
	}
	//删除留言板信息
	public function doWebMess_delete(){
		global $_W,$_GPC;
		$id=intval($_GPC['id']);
		if($_W['role']=="operator"){
			$del=pdo_query("DELETE FROM ".tablename($this->mess)." WHERE id=:id and uid=:uid and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid'],':uid'=>$_W['uid']));
		}else{
			$del=pdo_query("DELETE FROM ".tablename($this->mess)." WHERE id=:id and uniacid=:uniacid", array(':id'=>$id,':uniacid'=>$_W['uniacid']));
		}
		$url=$this->createWebUrl('Sweb_mess');

		if(!empty($del)){
				message('删除成功',$url,"success");
			}else{
				message('删除失败',$url,"error");
			}
	}
	// 控制显示状态的方法
	public function  doWebEdit_status () {
		global $_W,$_GPC;
		// 状态
		$is_show=intval($_GPC['is_show']);
		// 操作的id
		$id=intval($_GPC['id']);
		// 操作的表名
		$table=$_GPC['table'];
		// 跳转到的页面
		$urls=trim($_GPC['url']);
		$param=array('id'=>$id,'uniacid'=>$_W['uniacid']);
		$url=$this->createWebUrl($urls);
			if($is_show==1){
				$data['is_show']=0;
				$result=pdo_update($this->$table,$data,$param);
				if($result){
					message('项目编辑成功',$url,"success");
				}else{
					message('项目编辑失败',$url,"error");
				}	
			}else{
				$data['is_show']=1;
				$result=pdo_update($this->$table,$data,$param);
				if($result){
					message('项目编辑成功',$url,"success");
				}else{
					message('项目编辑失败',$url,"error");
				}	
			}
	}
	
	//手机展示页面
	public function doMobileIndex(){
			global $_W,$_GPC;
			// 关键字id
			$rid=intval($_GPC['rid']);
			// 获取的openid
			$openid=$_W['openid'];

			// 跳转地址
			$webs=pdo_fetchall("SELECT website FROM".tablename($this->website)."WHERE is_use=:is_use",array(':is_use'=>3));
			
			$snu=count($webs);
			$rand=mt_rand(0,$snu-1);
			$send_url=$webs[$rand]['website'];
			// 跳转地址带参数
			$url="http://letuhd.wicp.io/index.php/home/Sweb?rid=".$rid."&openid=".$openid."&uniacid=".$_W['uniacid'];
			// $url="http://".$send_url."/index.php/home/Sweb?rid=".$rid."&openid=".$openid."&uniacid=".$_W['uniacid'];
			header("Location:".$url);

			// // 站点的id
			// $site_id=pdo_fetch("SELECT id FROM".tablename($this->site)."WHERE rid=:rid and uniacid=:uniacid and is_show=:is_show",array(':rid'=>$rid,':uniacid'=>$_W['uniacid'],':is_show'=>1));
			// if(!$site_id['id']){
			// 	echo "<script>alert('您查看的站点已经关闭或已经删除');history.go(-1)</script>";die;
			// }
			// // 该站点下所有栏目
			// $cates=pdo_fetchall("SELECT id,cate_name,cate_pic FROM".tablename($this->cate)."WHERE site_id=:site_id and uniacid=:uniacid",array(':site_id'=>$site_id['id'],":uniacid"=>$_W['uniacid']));
			// if(!$cates){
			// 	echo "<script>alert('我们正在努力更新中敬请期待……');history.go(-1)</script>";die;
			// }
			// // 每个栏目下的详情内容
			// foreach ($cates as $k=> $v) {
			// 	$articless[$k][]=pdo_fetchall("SELECT id,article_name,article_detail FROM".tablename($this->article)."WHERE cate_id=:cate_id and uniacid=:uniacid",array(':cate_id'=>$v['id'],'uniacid'=>$_W['uniacid']));
			// 	$articless[$k]['cate_name']=$v['cate_name'];
			// }
			// // 每个站点下的轮播图
			// $carousels=pdo_fetchall('SELECT id,carousel_pic FROM'.tablename($this->carousel)."WHERE site_id=:site_id and uniacid=:uniacid",array(':site_id'=>$site_id['id'],':uniacid'=>$_W['uniacid']));
			
	}
}