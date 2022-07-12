<%@
	page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="../common/head.jsp">
	<jsp:param value="cont" name="prefixCssName"/>
</jsp:include>


<body>
    <div id="wrap">
      <div id="container">
        <%@ include file="../common/menu.jsp" %>
        <div id="contents">
          <div class="wfix">
            <div class="tit_comm">
              <h3 class="tit">ジム登録</h3>
            </div>
            <div class="wrap_upload">
              <form action="" method="post" enctype="multipart/form-data">
              	<fieldset>
					<div id="file_3d" class="fileupload_area item item1">
						<div class="cont_upload">
							<div class="area_drag">
								<div class="filebox1">
									<label for="ex_file">写真を追加</label>
									<input id="ex_file" type="file" enctype="multipart/form-data" multiple="">
								</div>
								<p>
									アップロードするファイルを選択するか、直接ドラッグしてください。<div class=""></div><br />
									ファイルフォーマットは png, jpgが可能です。<br />
								</p>
							</div>
							<ul class="list_file"></ul>
						</div>
					</div>

					<div class="item item2">
						<div class="hd_upload">
							<strong class="tit">ジム 情報</strong>
						</div>
						<div class="cont_upload" id="tbody_contents">
							<dl>
                                <dt>ジム名</dt>
                                <dd><input type="text" class="inp" placeholder="ジム名"  id="conts_name"></dd>
                            </dl>

                            <dl>
                                <dt>ジム名 分類</dt>
                                <dd>
                                    <select class="slt"  id="sel_main" name="select1" >
                                        <option value="1">some</option>
                                        <option value="2">some</option>
                                        <option value="3">some</option>
                                    </select>
                                    <select class="slt"  id="sel_division" name="select3">
                                    <option value="some">some</option>
                                    </select>
                                </dd>
                            </dl>

						</div>
					</div>


					<div class="item item3">
						<div class="cont_upload">
							<dl>
							<dt>콘텐츠 설명</dt>
							<dd><textarea class="inp" placeholder="콘텐츠 설명" id="conts_desc" name="textarea"></textarea></dd>
							</dl>
						</div>
					</div>
					<div class="tac">
						<button id="btn_delete"  type="button" class="btn_bold" style="display:none;" onclick="clickBtnDelete()">콘텐츠 삭제</button>
						<button id="btn_preview" type="button" class="btn_bold" style="display:none;" onclick="clickBtnSave('3')">콘텐츠 수정 (비공개)</button>
						<button id="btn_update" type="button" class="btn_bold" style="display:none;" onclick="clickBtnSave('1')">콘텐츠 수정</button>
						<!--<button id="btn_update" type="button" class="btn_bold" style="display:none;" onclick="clickBtnSave('1')">콘텐츠 수정 (공개)</button>-->
						<button id="btn_pub"  type="button" class="btn_bold" style="display:none;" onclick="clickBtnSave('1')">콘텐츠 업로드 (공개)</button>
					</div>

				</fieldset>
              </form>
            </div>
          </div>
        </div>
        <%@ include file="../common/footer.jsp" %>
      </div>

    </div>


	<div id="progress" style="position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; line-height: 100vh; text-align:center; background-color: rgba(255,255,255,0.5); z-index: 99; display: none;">
		<img src="<c:url value='/images/img/progress.gif'/>" style="width: 100px; vertical-align: middle">
	</div>
  </body>
</html>