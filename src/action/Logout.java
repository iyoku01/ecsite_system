package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //ƒZƒbƒVƒ‡ƒ“•Ï”user_id‚ğíœ
        HttpSession session = request.getSession(true);
        session.removeAttribute("user_id");

        return "Top.Control";
    }

}
