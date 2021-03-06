package com.zzl.weierp.controller.pc.order;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzl.weierp.common.globalConst.GlobalConst;
import com.zzl.weierp.domain.Busi;
import com.zzl.weierp.service.pc.order.PcOrderService;

@RequestMapping("pc/order")
@Controller
public class PcOrderController {
	
	@Autowired
	private PcOrderService pcOrderService;
	
	/**
	 * 进入订单列表页面
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String page(Model model, HttpSession session) {

		// check session
//		Long userId = (Long) SessionUtil.getUserId(session);
//		if (null == userId) {
//			return "common/timeout";
//		}

		// query busis
		model.addAttribute("busis", Busi.findAllBusis());

		return "pc/order/pcOrder";
	}
	
	@RequestMapping(value = "/query/list", method = RequestMethod.GET)
	public String queryList(Model model, HttpSession session,
			@RequestParam(required = false) Long busiId,
			@RequestParam(required = false) Integer page,
			@RequestParam(required = false) Integer size,
			@RequestParam(required = false) String keyword,
			@RequestParam Integer status) {

		// 1.check session
//		Long busiId = (Long) session.getAttribute("busiId");
//		if (null == busiId) {
//			return "common/timeout";
//		}

		// 2.query products
		model.addAttribute("orders", pcOrderService.queryList(model, keyword, page, size, busiId, status));
		
		// return view
		if(status == GlobalConst.ORDER_STATUS_TODO) {
			return "pc/order/pcOrderListTodo";
		}
		return "pc/order/pcOrderListDone";
		
	}
	
	
	/**
	 * 改为发货状态
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/done/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String done(@PathVariable Long id, HttpSession session) {

		// check session
//		Long userId = (Long) SessionUtil.getUserId(session);
//		if (null == userId) {
//			return "common/timeout";
//		}

		// send
		return pcOrderService.done(id);
	}

}
