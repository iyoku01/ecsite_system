<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<div class="row">
    <header>
        <h3>
            <form action="Top.Control" method="post" class="form-group">
                <div class="col-xs-1">
                    <a href=Top.Control>Top</a>
                </div>
                <div class="col-xs-6">
                    <div class="input-group">
                        <label class="input-group-addon">検索</label> <input type="text" class="form-control" name="search" placeholder="商品名を入力" required> <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit" name="action" value="productSerch">検索ボタン</button>
                        </span>
                    </div>
                </div>
                <div class="col-xs-5">
                    <a href=Cart.Control>Cart</a> / <a href=http://localhost:8080/ecsite_system/login.jsp>Login</a> / <a href=Logout.Control>Logout</a>/<a href=MyPage.Control>Mypage</a>
                </div>
            </form>
        </h3>
    </header>
</div>

