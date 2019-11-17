<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /top_nav-->
<!-- /nav-->
<div class="w3_agileits_top_nav">
	<ul id="gn-menu" class="gn-menu-main">
		<!-- /nav_agile_w3l -->
		<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><i
				class="fa fa-bars" aria-hidden="true"></i><span>Menu</span></a>
			<nav class="gn-menu-wrapper">
				<div class="gn-scroller scrollbar1">
					<ul class="gn-menu agile_menu_drop">
						<li><a href="${pageContext.request.contextPath}/nhom-dich/thanh-vien/index"> <i class="fa fa-tachometer"></i>
								Trang Chính
						</a></li>
						<li><a href="#"><i class="fa fa-table" aria-hidden="true"></i>
								Quản lý <i class="fa fa-angle-down" aria-hidden="true"></i></a>
							<ul class="gn-submenu">
								<li class="mini_list_agile"><a href="buttons.html"><i
										class="fa fa-caret-right" aria-hidden="true"></i>QL tài khoản dịch</a></li>
								<li class="mini_list_w3"><a href="grids.html"> <i
										class="fa fa-caret-right" aria-hidden="true"></i>QL ....
									
								</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-line-chart" aria-hidden="true"></i>Thống kê
								 <i class="fa fa-angle-down" aria-hidden="true"> </i></a>
							<ul class="gn-submenu">
								<li class="mini_list_agile"><a href="typo.html"><i
										class="fa fa-caret-right" aria-hidden="true"></i> Số lượng lượt xem</a></li>
								<li class="mini_list_w3"><a href="icons.html"> <i
										class="fa fa-caret-right" aria-hidden="true"></i> Số lượng tài khoản đã dịch
								</a></li>
								<li class="mini_list_w3"><a href="icons.html"> <i
										class="fa fa-caret-right" aria-hidden="true"></i> Số lượng .....
								</a></li>

							</ul></li>
					
						<li><a href="table.html"> <i class="fa fa-cogs"
								aria-hidden="true"></i> Cài đặt
						</a></li>
						<li><a href="#"> <i class="fa fa-suitcase"
								aria-hidden="true"></i>Thông tin thêm <i class="fa fa-angle-down"
								aria-hidden="true"></i></a>
							<ul class="gn-submenu">
								<li class="mini_list_agile"><a href="faq.html"> <i
										class="fa fa-caret-right" aria-hidden="true"></i> Giới thiệu
								</a></li>
								<li class="mini_list_w3"><a href="blank.html"> <i
										class="fa fa-caret-right" aria-hidden="true"></i> Gửi phản hồi
								</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /gn-scroller -->
			</nav></li>
		<!-- //nav_agile_w3l -->
		<li class="second logo"><h1>
				<a href="main-page.html"><i class="fa fa-graduation-cap"
					aria-hidden="true"></i>Thành viên: Nguyễn Văn A</a>
			</h1></li>
		<li class="second admin-pic">
			<ul class="top_dp_agile">
				<li class="dropdown profile_details_drop"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false">
						<div class="profile_img">
							<span class="prfil-img"><img
								src="${pageContext.request.contextPath}/template/TranslateTeam/images/admin.jpg"
								alt=""> </span>
						</div>
				</a>
					<ul class="dropdown-menu drp-mnu">
						<li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
						<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out"></i> Logout</a></li>
					</ul></li>

			</ul>
		</li>
		<li class="second top_bell_nav">
			<ul class="top_dp_agile ">
				<li class="dropdown head-dpdn"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i
						class="fa fa-bell-o" aria-hidden="true"></i> <span
						class="badge blue">4</span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="notification_header">
								<h3>Thông báo của bạn</h3>
							</div>
						</li>
						<li><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a3.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>John Smith</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>1 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li class="odd"><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a1.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>Jasmin Leo</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>3 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a2.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>James Smith</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>2 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a4.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>James Smith</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>1 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li>
							<div class="notification_bottom">
								<a href="#">See all Notifications</a>
							</div>
						</li>
					</ul></li>

			</ul>
		</li>
		<li class="second top_bell_nav">
			<ul class="top_dp_agile ">
				<li class="dropdown head-dpdn"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i
						class="fa fa-envelope-o" aria-hidden="true"></i> <span
						class="badge blue">3</span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="notification_header">
								<h3>Tin nhắn</h3>
							</div>
						</li>
						<li><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a3.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>John Smith</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>3 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li class="odd"><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a1.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>Jasmin Leo</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>2 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li><a href="#">
								<div class="user_img">
									<img
										src="${pageContext.request.contextPath}/template/TranslateTeam/images/a2.jpg"
										alt="">
								</div>
								<div class="notification_desc">
									<h6>James Smith</h6>
									<p>Lorem ipsum dolor</p>
									<p>
										<span>1 hour ago</span>
									</p>
								</div>
								<div class="clearfix"></div>
						</a></li>
						<li>
							<div class="notification_bottom">
								<a href="#">See all Messages</a>
							</div>
						</li>
					</ul></li>

			</ul>
		</li>
		<li class="second top_bell_nav">
			<ul class="top_dp_agile ">
				<li class="dropdown head-dpdn"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"><i class="fa fa-tasks"></i><span
						class="badge blue">9</span></a>
					<ul class="dropdown-menu">
						<li>
							<div class="notification_header">
								<h3>Công việc hiện tại</h3>
							</div>
						</li>
						<li><a href="#">
								<div class="task-info">
									<span class="task-desc">Tiên hiệp</span><span
										class="percentage">40%</span>
									<div class="clearfix"></div>
								</div>
								<div class="progress progress-striped active">
									<div class="bar yellow" style="width: 40%;"></div>
								</div>
						</a></li>
						<li><a href="#">
								<div class="task-info">
									<span class="task-desc">Đấu sĩ giang hồ</span><span
										class="percentage">90%</span>
									<div class="clearfix"></div>
								</div>
								<div class="progress progress-striped active">
									<div class="bar green" style="width: 90%;"></div>
								</div>
						</a></li>
						<li><a href="#">
								<div class="task-info">
									<span class="task-desc">Trần Hồn Nhai</span><span
										class="percentage">100%</span>
									<div class="clearfix"></div>
								</div>
								<div class="progress progress-striped active">
									<div class="bar red" style="width: 100%;"></div>
								</div>
						</a></li>
						<li><a href="#">
								<div class="task-info">
									<span class="task-desc">Tân Tây Du Kí</span><span
										class="percentage">80%</span>
									<div class="clearfix"></div>
								</div>
								<div class="progress progress-striped active">
									<div class="bar  blue" style="width: 80%;"></div>
								</div>
						</a></li>
						<li>
							<div class="notification_bottom">
								<a href="#">Tất cả các công việc</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</li>

		<li class="second w3l_search">

			<form action="#" method="post">
				<input type="search" name="search"
					placeholder="Nhập nội dung tìm kiếm..." required="">
				<button class="btn btn-default" type="submit">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
			</form>

		</li>
		<li class="second full-screen"></li>

	</ul>
	<!-- //nav -->

</div>