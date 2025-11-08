package com.moviematch.moviematch_backend;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class MoviematchBackendApplicationTests {

	private final boolean shouldPass = true;
	@Test
	void contextLoads() {
	}

	@Test
	void simpleToggleTest() {
		if (shouldPass) {
			assertTrue(true, "Test pass");
		} else {
			fail("Test fail");
		}
	}

}
