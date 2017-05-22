<?php
/**
 * 过节喽模块处理程序
 *
 * @author 红途小莜
 * @url http://bbs.we7.cc/
 */
defined('IN_IA') or exit('Access Denied');

class Htxy_festivalModuleProcessor extends WeModuleProcessor {
	public $active="htxy_festival_active";

	public function respond() {
		$content = $this->message['content'];
		//这里定义此模块进行消息处理时的具体过程, 请查看微擎文档来编写你的代码
		$rid = $this->rule;
		$reply = pdo_fetch("SELECT share_title,share_pic,share_desc,active_end,active_start,rid FROM " . tablename($this->active) . " WHERE `rid`=:rid LIMIT 1", array(':rid' => $rid));
        if ($reply == false) {
            return $this->respText('活动已经取消...');
        }
        $date=date("Y-m-d H:i:s");
        if($date>$reply['active_end']){
            return $this->respText('活动已经结束敬请期待下次活动');

        }
		if($date<$reply['active_start']){
		    return $this->respText('活动尚未开始请耐心等待');

		}
         return $this->respNews(array(
                        'Title' => $reply['share_title'],
                        'Description' => $reply['share_desc'],
                        'PicUrl' => tomedia($reply['share_pic']),
                        'Url' => $this->createMobileUrl("index", array("rid" => $reply['rid'])),
            ));
	}
}