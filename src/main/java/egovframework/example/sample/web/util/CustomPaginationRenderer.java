package egovframework.example.sample.web.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class CustomPaginationRenderer extends AbstractPaginationRenderer{
	
	public CustomPaginationRenderer() {
		firstPageLabel = "<a href=\"#\" class=\"page_btn w-button\" onclick=\"{0}({1}); return false;\">◀◀</a>";
		previousPageLabel = "<a href=\"#\" class=\"page_btn w-button\" onclick=\"{0}({1}); return false;\">◀</a>";
		currentPageLabel = "<a href=\"#\" class=\"page_btn click w-button\">{0}</a>";
		otherPageLabel = "<a href=\"#\" class=\"page_btn w-button\" onclick=\"{0}({1}); return false;\">{2}</a>";
		nextPageLabel = "<a href=\"#\" class=\"page_btn w-button\" onclick=\"{0}({1}); return false;\">▶</a>";
		lastPageLabel = "<a href=\"#\" class=\"page_btn w-button\" onclick=\"{0}({1}); return false;\">▶▶</a>";		
	}
}

