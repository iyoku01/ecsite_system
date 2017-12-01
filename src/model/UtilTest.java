package model;

import static model.Util.*;
import static org.junit.Assert.*;

import java.sql.Timestamp;

import org.junit.AfterClass;
import org.junit.Test;

public class UtilTest {

    @AfterClass
    public static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testConvertTimestamp() {
        //        String dateTime = "2001-01-02 03:04:05";
        String dateTime = "2017-11-17 14:01:17";

        Timestamp t = convertTimestampFromString(dateTime);
        System.out.println("Timestamp      = " + t);
        String s = convertStringFromTimestamp(t);
        System.out.println("String         = " + s);

        System.out.println("formatDateTime = " + formatDateTime(dateTime));

        assertEquals("2001-01-02 03:04:05.0", convertTimestampFromString("2001-01-02 03:04:05.0").toString());
        assertNull(convertTimestampFromString("2001-01-99 03:04:05"));
    }

    @Test
    public void testIsBlank() {
        assertTrue(isBlank(""));
        assertTrue(isBlank(null));
        assertFalse(isBlank("a"));
    }

    @Test
    public void testEscapeHtml() {
        assertEquals("a&amp;b&lt;c&gt;d/e&#39;f", escapeHtml("a&b<c>d/e'f"));
    }

    @Test
    public void testUnescapeHtml() {
        assertEquals("a&b<c>d/e'f", unescapeHtml("a&amp;b&lt;c&gt;d/e&#39;f"));
    }
}
