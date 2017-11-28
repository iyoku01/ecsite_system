package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Util {

    final static private String DATETIME_FORMAT = "yyyy-MM-dd kk:mm:ss";

    //インスタンス化禁止
    private Util() {
    }

    static public boolean isBlank(String s) {
        if (s == null || s.equals(""))
            return true;
        else
            return false;
    }

    static public String nz(String s) {
        if (s == null)
            return "";
        else
            return s;
    }

    static public Timestamp convertTimestampFromString(String dateTime) {
        return convertTimestampFromString(dateTime, DATETIME_FORMAT);
    }

    static public Timestamp convertTimestampFromString(String dateTime, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setLenient(false);
        try {
            return new Timestamp(sdf.parse(dateTime).getTime());
        } catch (ParseException e) {
            return null;
        }
    }

    static public String convertStringFromTimestamp(Timestamp dateTime) {
        return convertStringFromTimestamp(dateTime, DATETIME_FORMAT);
    }

    static public String convertStringFromTimestamp(Timestamp dateTime, String format) {
        if (dateTime == null)
            return "";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(dateTime);
    }

    static public String formatDateTime(String dateTime) {
        return convertStringFromTimestamp(convertTimestampFromString(dateTime));
    }

    static public String escapeHtml(String s) {
        if (s == null)
            return s;
        else
            return s.replaceAll("&", "&amp;")
                    .replaceAll("<", "&lt;")
                    .replaceAll(">", "&gt;")
                    .replaceAll("\"", "&quot;")
                    .replaceAll("'", "&#39;");

    }

    static public String unescapeHtml(String s) {
        if (s == null)
            return s;
        else
            return s.replaceAll("&#39;", "'")
                    .replaceAll("&quot;", "\"")
                    .replaceAll("&gt;", ">")
                    .replaceAll("&lt;", "<")
                    .replaceAll("&amp;", "&");
    }

}
