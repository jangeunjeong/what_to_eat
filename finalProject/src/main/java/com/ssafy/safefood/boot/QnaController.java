package com.ssafy.safefood.boot;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.safefood.help.QnaSeqResult;
import com.ssafy.safefood.model.Qna;
import com.ssafy.safefood.model.QnaComment;
import com.ssafy.safefood.service.IQnaService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

//http://localhost:8197/humans/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api")
@Api(value = "SSAFY", description = "SSAFY Resouces Management 2019")
public class QnaController {

	public static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private IQnaService qnaService;

	@ApiOperation(value = "모든 게시물의 정보를 반환한다.", response = List.class)
	@RequestMapping(value = "/qnas", method = RequestMethod.GET)
	public ResponseEntity<List<Qna>> qnas() throws Exception {
		logger.info("1-------------qnas-----------------------------" + new Date());
		List<Qna> qnas = qnaService.getQnaList();
		for (Qna b : qnas) {
			System.out.println(b.toString());
		}
		if (qnas.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Qna>>(qnas, HttpStatus.OK);
	}

	@ApiOperation(value = "새로운 질문을  등록한다 그리고 그 게시물의 seq을 반환한다.", response = QnaSeqResult.class)
	@RequestMapping(value = "/saveQna", method = RequestMethod.POST)
	public ResponseEntity<QnaSeqResult> saveQna(@RequestBody Qna dto) throws Exception {
		logger.info("5-------------saveQna-----------------------------" + new Date());
		logger.info("5-------------saveQna-----------------------------" + dto);
		qnaService.addqna(dto);
//		Qna b = qnaService.qnadetail(dto.getSeq());
		QnaSeqResult br = new QnaSeqResult();
//		br.setSeq(b.getSeq());
		br.setTitle("saveQna");
		br.setState("succ");
		logger.info("5-------------saveQna-------seq------------------" + br);
//		if (b == null || b.getSeq() == 0 || b.getTitle().equals("")) {
//			br.setSeq(0);
//			br.setTitle("saveBook");
//			br.setState("fail");
//			// return new ResponseEntity(HttpStatus.NO_CONTENT);
//			return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
//		}
		return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
	}

	@ApiOperation(value = "번호에 해당하는 게시물의 정보를 반환한다.", response = Qna.class)
	@RequestMapping(value = "/qna/{seq}", method = RequestMethod.GET)
	public ResponseEntity<Qna> detailQna(@PathVariable String seq) throws Exception {
		logger.info("1-------------book-----------------------------" + new Date());
		Qna qna = qnaService.qnadetail(Integer.parseInt(seq));
		System.out.println(qna.toString());
		if (qna == null || qna.getSeq() == 0) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Qna>(qna, HttpStatus.OK);
	}

	@ApiOperation(value = " 게시물을 업데이트한다. 그리고 그 게시물의 seq를 반환한다.", response = QnaSeqResult.class)
	@RequestMapping(value = "/updateQna", method = RequestMethod.POST)
	public ResponseEntity<QnaSeqResult> updateQna(@RequestBody Qna dto) throws Exception {
		logger.info("5-------------updateQna-----------------------------" + new Date());
		logger.info("5-------------updateQna-----------------------------" + dto);
		// 비밀번호 확인하기
		Qna pw = qnaService.qnadetail(dto.getSeq());
		QnaSeqResult br = new QnaSeqResult();
		if (!dto.getPw().equals(pw.getPw())) {
			br.setSeq(0);
			br.setTitle("updateBook");
			br.setState("fail");
			// return new ResponseEntity(HttpStatus.NO_CONTENT);
			return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
		}

		qnaService.update(dto);
		Qna b = qnaService.qnadetail(dto.getSeq());
		br.setSeq(b.getSeq());
		br.setTitle("updatebook");
		br.setState("succ");
		logger.info("5-------------updateBook-------id------------------" + br);
		if (b == null || b.getSeq() == 0) {
			br.setSeq(0);
			br.setTitle("updateBook");
			br.setState("fail");
			// return new ResponseEntity(HttpStatus.NO_CONTENT);
			return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
		}
		return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
	}

	@ApiOperation(value = " 해당 게시물을 정보를 삭제한다. 삭제하기 전 여러 작업을 해야한다. 여기서는 히스토리를 모두 지우고(수정한 적이 없다면 바로 삭제가능) 삭제할 수 있다 .", response = QnaSeqResult.class)
	@RequestMapping(value = "/deleteQna", method = RequestMethod.POST)
	public ResponseEntity<QnaSeqResult> deleteQna(@RequestBody Qna dto) throws Exception {
		logger.info("1-------------deleteQna-----------------------------" + new Date());
		logger.info("1-------------deleteQna-----------------------------" + dto.toString());

		Qna pw = qnaService.qnadetail(dto.getSeq());

		QnaSeqResult br = new QnaSeqResult();

		if (!dto.getPw().equals(pw.getPw())) {
			br.setSeq(0);
			br.setTitle("deleteQna");
			br.setState("fail");
			// return new ResponseEntity(HttpStatus.NO_CONTENT);
			return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
		}

		qnaService.delete(dto.getSeq());

		br.setSeq(dto.getSeq());
		br.setTitle("deletebook");
		br.setState("succ");

		return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
	}

	@ApiOperation(value = "해당 게시물의 답변을 반환한다.", response = List.class)
	@RequestMapping(value = "/comments/{seq}", method = RequestMethod.GET)
	public ResponseEntity<List<QnaComment>> comments(@PathVariable String seq) throws Exception {
		logger.info("1-------------comments-----------------------------" + new Date());
		List<QnaComment> cmts = qnaService.getQnaCommentsList(Integer.parseInt(seq));
		for (QnaComment b : cmts) {
			System.out.println(b.toString());
		}
		if (cmts.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<QnaComment>>(cmts, HttpStatus.OK);
	}

	@ApiOperation(value = "새로운  답변을  등록한다 그리고 그 게시물의 seq을 반환한다.", response = QnaSeqResult.class)
	@RequestMapping(value = "/saveQnaComment", method = RequestMethod.POST)
	public ResponseEntity<QnaSeqResult> saveQnaComment(@RequestBody QnaComment dto) throws Exception {
		logger.info("5-------------saveQnaComment-----------------------------" + new Date());
		logger.info("5-------------saveQnaComment-----------------------------" + dto);

		qnaService.addcomment(dto);

		QnaSeqResult br = new QnaSeqResult();
		br.setSeq(dto.getSeq());
		br.setTitle("saveQnaComment");
		br.setState("succ");
		logger.info("5-------------saveQna-------seq------------------" + br);
		if (dto == null) {
			br.setSeq(0);
			br.setTitle("saveQnaComment");
			br.setState("fail");
			// return new ResponseEntity(HttpStatus.NO_CONTENT);
			return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
		}
		return new ResponseEntity<QnaSeqResult>(br, HttpStatus.OK);
	}

}
