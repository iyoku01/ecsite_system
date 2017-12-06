package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/***
 * ���[�e�B���e�B�l�ߍ��킹
 * @author �ɔ\
 *
 */
public class Util {

    //�ϊ��p�̓�������
    final static private String DATETIME_FORMAT = "yyyy-MM-dd kk:mm:ss";

    //�C���X�^���X���֎~
    private Util() {
    }

    /***
     * �u�����N�Anull�𔻒肷��
     * @param s ����Ώۂ̕�����
     * @return �u�����N�Anull�̂Ƃ��Atrue��Ԃ�
     */
    static public boolean isBlank(String s) {
        if (s == null || s.equals(""))
            return true;
        else
            return false;
    }

    /***
     * null���󕶎��ɕϊ�����
     * @param s �ϊ����̕�����
     * @return �ϊ���̕������Ԃ�
     */
    static public String nz(String s) {
        if (s == null)
            return "";
        else
            return s;
    }

    /***
     * �������Timestamp�֕ϊ�����
     * @param dateTime �ϊ����̕�����
     * @return �ϊ����Timestamp��Ԃ�
     */
    static public Timestamp convertTimestampFromString(String dateTime) {
        return convertTimestampFromString(dateTime, DATETIME_FORMAT);
    }

    /***
     * �������Timestamp�֕ϊ�����i�����w�肠��j
     * @param dateTime �ϊ����̕�����
     * @param format ��������
     * @return �ϊ����Timestamp��Ԃ�
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
     * Timestamp�𕶎���֕ϊ�����
     * @param dateTime �ϊ�����Timestamp
     * @return �ϊ���̕������Ԃ�
     */
    static public String convertStringFromTimestamp(Timestamp dateTime) {
        return convertStringFromTimestamp(dateTime, DATETIME_FORMAT);
    }

    /***
     * Timestamp�𕶎���֕ϊ�����i�����w�肠��j
     * @param dateTime �ϊ�����Timestamp
     * @param format ��������
     * @return �ϊ���̕������Ԃ�
     */
    static public String convertStringFromTimestamp(Timestamp dateTime, String format) {
        if (dateTime == null)
            return "";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(dateTime);
    }

    /***
     * ���������t�����ɐ��`����
     * @param dateTime ���`�Ώۂ̕�����
     * @return ���`��̕������Ԃ�
     */
    static public String formatDateTime(String dateTime) {
        return convertStringFromTimestamp(convertTimestampFromString(dateTime));
    }

    /***
     * HTML���ꕶ�����G�X�P�[�v����i&��&amp�j
     * @param s �Ώۂ̕�����
     * @return �ϊ���̕������Ԃ�
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
     * HTML���ꕶ�����A���G�X�P�[�v����i&amp��&�j
     * @param s �Ώۂ̕�����
     * @return �ϊ���̕������Ԃ�
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
