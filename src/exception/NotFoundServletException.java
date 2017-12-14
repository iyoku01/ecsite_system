package exception;

/**
 * サーブレット未検出対応用 自作エラークラス
 */
public class NotFoundServletException extends Exception {
    public NotFoundServletException(String message) {
        super(message);
    }
}
