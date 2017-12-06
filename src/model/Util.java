package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/***
 * ユーティリティ詰め合わせ
 * @author 伊能
 *
 */
public class Util {

    //変換用の日時書式
    final static private String DATETIME_FORMAT = "yyyy-MM-dd kk:mm:ss";

    //インスタンス化禁止
    private Util() {
    }

    /***
     * ブランク、nullを判定する
     * @param s 判定対象の文字列
     * @return ブランク、nullのとき、trueを返す
     */
    static public boolean isBlank(String s) {
        if (s == null || s.equals(""))
            return true;
        else
            return false;
    }

    /***
     * nullを空文字に変換する
     * @param s 変換元の文字列
     * @return 変換後の文字列を返す
     */
    static public String nz(String s) {
        if (s == null)
            return "";
        else
            return s;
    }

    /***
     * 文字列をTimestampへ変換する
     * @param dateTime 変換元の文字列
     * @return 変換後のTimestampを返す
     */
    static public Timestamp convertTimestampFromString(String dateTime) {
        return convertTimestampFromString(dateTime, DATETIME_FORMAT);
    }

    /***
     * 文字列をTimestampへ変換する（書式指定あり）
     * @param dateTime 変換元の文字列
     * @param format 日時書式
     * @return 変換後のTimestampを返す
     */
    static public Timestamp convertTimestampFromString(String dateTime, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        sdf.setLenient(false);
        try {
            return new Timestamp(sdf.parse(dateTime).getTime());
        } catch (ParseException e) {
            return null;
        }
    }

    /***
     * Timestampを文字列へ変換する
     * @param dateTime 変換元のTimestamp
     * @return 変換後の文字列を返す
     */
    static public String convertStringFromTimestamp(Timestamp dateTime) {
        return convertStringFromTimestamp(dateTime, DATETIME_FORMAT);
    }

    /***
     * Timestampを文字列へ変換する（書式指定あり）
     * @param dateTime 変換元のTimestamp
     * @param format 日時書式
     * @return 変換後の文字列を返す
     */
    static public String convertStringFromTimestamp(Timestamp dateTime, String format) {
        if (dateTime == null)
            return "";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(dateTime);
    }

    /***
     * 文字列を日付書式に整形する
     * @param dateTime 整形対象の文字列
     * @return 整形後の文字列を返す
     */
    static public String formatDateTime(String dateTime) {
        return convertStringFromTimestamp(convertTimestampFromString(dateTime));
    }

    /***
     * HTML特殊文字をエスケープする（&→&amp）
     * @param s 対象の文字列
     * @return 変換後の文字列を返す
     */
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

    /***
     * HTML特殊文字をアンエスケープする（&amp→&）
     * @param s 対象の文字列
     * @return 変換後の文字列を返す
     */
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
