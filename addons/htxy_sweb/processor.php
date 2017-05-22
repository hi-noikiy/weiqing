<?php
/**
 * 微网站模块处理程序
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_swebModuleProcessor extends WeModuleProcessor {
	public $site = "htxy_sweb_site";

	public function respond() {
		$content = $this->message['content'];
		$rid = $this->rule;
		$reply = pdo_fetch("SELECT * FROM " . tablename($this->site) . " WHERE `rid`=:rid LIMIT 1", array(':rid' => $rid));
        if ($reply == false) {
            return $this->respText('活动已经取消...');
        }

         return $this->respNews(array(
                        'Title' => $reply['share_title'],
                        'Description' => $reply['share_desc'],
                        'PicUrl' => tomedia($reply['share_pic']),
                        'Url' => $this->createMobileUrl("index", array("rid" => $reply['rid'])),
            ));

		//这里定义此模块进行消息处理时的具体过程, 请查看微擎文档来编写你的代码
	}
}