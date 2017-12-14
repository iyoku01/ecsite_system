<%@ page contentType="text/html; charset=Windows-31J"%>
<!DOCTYPE html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<div class="row">
    <header>
  <h3>
  <form action="Top.Control" method="post" class="form-group">
      <a href="Top.Control">
      <img src="img\CompanyLogo\watazon_logo.png" alt="企業ロゴ"  height=70px >
      </a>
      <div class="kensaku">
          <input type="text" class="form-control" name="search" placeholder="商品名を入力" required>
          <span class="input-group-btn">
          <button class="btn btn-primary" type="submit" name="action" value="productSerch">検索ボタン</button>
        </span>
        <a href=Cart.Control>Cart</a> / <a href=http://localhost:8080/ecsite_system/login.jsp>新規登録/ログイン</a> / <a href=Logout.Control>ログアウト</a>/<a href=MyPage.Control>マイページ</a>

      </div>
    </form>
</h3>
</header>
</div>

