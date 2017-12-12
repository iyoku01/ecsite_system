/*###########################################################################
 # DB作成
 ############################################################################*/
DROP DATABASE IF EXISTS ecsite_db;
CREATE DATABASE ecsite_db;
USE ecsite_db;


/*###########################################################################
 # TABLE作成
 ############################################################################*/
DROP TABLE IF EXISTS product_pic_tbl;
DROP TABLE IF EXISTS recommend_tbl;
DROP TABLE IF EXISTS conversion_tbl;
DROP TABLE IF EXISTS review_tbl;
DROP TABLE IF EXISTS product_mst;
DROP TABLE IF EXISTS hard_tbl;
DROP TABLE IF EXISTS order_product_tbl;
DROP TABLE IF EXISTS order_tbl;
DROP TABLE IF EXISTS personal_mst;
DROP TABLE IF EXISTS category_tbl;

/**********************************/
/* テーブル名: カテゴリーテーブル */
/**********************************/
CREATE TABLE category_tbl(
        category_id                   		INT(10)		 NOT NULL		 PRIMARY KEY COMMENT 'カテゴリーID',
        category_name                 		VARCHAR(20)		 NULL  COMMENT 'カテゴリー名'
) COMMENT='カテゴリーテーブル';

/**********************************/
/* テーブル名: 個人情報マスタ */
/**********************************/
CREATE TABLE personal_mst(
        user_id                       		CHAR(10)		 NOT NULL		 PRIMARY KEY COMMENT 'ユーザーID',
        password                      		VARCHAR(24)		 NULL  COMMENT 'パスワード',
        name                          		VARCHAR(30)		 NULL  COMMENT '名前',
        nickname                      		VARCHAR(20)		 NULL  COMMENT 'ニックネーム',
        phone                         		CHAR(12)		 NULL  COMMENT '電話番号',
        postal_code                   		CHAR(7)		 NULL  COMMENT '郵便番号',
        address                       		VARCHAR(50)		 NULL  COMMENT '住所'
) COMMENT='個人情報マスタ';

/**********************************/
/* テーブル名: 注文テーブル */
/**********************************/
CREATE TABLE order_tbl(
        order_id                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '注文番号',
        user_id                       		CHAR(10)		 NULL  COMMENT 'ユーザー名',
        date                          		DATETIME		 NULL  COMMENT '注文日時',
        shipping                      		BIT		 DEFAULT 1		 NULL  COMMENT '発送フラグ',
  FOREIGN KEY (user_id) REFERENCES personal_mst (user_id)
) COMMENT='注文テーブル';

/**********************************/
/* テーブル名: 注文内容テーブル */
/**********************************/
CREATE TABLE order_product_tbl(
        order_id                      		INT(10)		 NOT NULL COMMENT '注文番号',
        product_id                    		INT(10)		 NOT NULL COMMENT '商品番号',
        number                        		INT(10)		 NULL  COMMENT '個数',
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES order_tbl (order_id)
) COMMENT='注文内容テーブル';

/**********************************/
/* テーブル名: ハードテーブル */
/**********************************/
CREATE TABLE hard_tbl(
        hard_id                       		INT(10)		 NULL 		 PRIMARY KEY COMMENT 'ハードID',
        hard_name                     		VARCHAR(20)		 NULL  COMMENT 'ハード名'
) COMMENT='ハードテーブル';

/**********************************/
/* テーブル名: 商品マスタ */
/**********************************/
CREATE TABLE product_mst(
        product_id                    		INT(10)		 NOT NULL		 PRIMARY KEY COMMENT '商品ID',
        product_name                  		VARCHAR(30)		 NULL  COMMENT '商品名',
        price                         		INT(10)		 NULL  COMMENT '金額',
        info                       		TEXT		 NULL  COMMENT '商品説明',
        stocks                        		MEDIUMINT(10)		 NULL  COMMENT '在庫数',
        comment                       		TEXT		 NULL  COMMENT 'コメント',
        hard_id                       		INT(10)		 NULL  COMMENT 'ハードID',
        category_id                   		INT(10)		 NULL  COMMENT 'カテゴリーID',
        ave_eval                      		FLOAT(10)		 NULL  COMMENT '平均評価',
        review_count                  		MEDIUMINT(10)		 NULL  COMMENT 'レビュー数',
  FOREIGN KEY (category_id) REFERENCES category_tbl (category_id),
  FOREIGN KEY (hard_id) REFERENCES hard_tbl (hard_id)
) COMMENT='商品マスタ';

/**********************************/
/* テーブル名: レビューテーブル */
/**********************************/
CREATE TABLE review_tbl(
        review_id                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT 'レビューID',
        product_id                    		INT(10)		 NULL  COMMENT '商品ID',
        user_id                       		VARCHAR(10)		 NULL  COMMENT 'ユーザーID',
        evaluation                    		INT(1)		 NULL  COMMENT '評価',
        review                        		TEXT		 NULL  COMMENT 'レビュー',
        date                          		DATETIME		 NULL  COMMENT 'レビュー日時',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id),
  FOREIGN KEY (user_id) REFERENCES personal_mst (user_id)
) COMMENT='レビューテーブル';

/**********************************/
/* テーブル名: 商品別名テーブル */
/**********************************/
CREATE TABLE conversion_tbl(
        product_id                    		INT(10)		 NULL 		 PRIMARY KEY COMMENT '商品ID',
        conversion_word               		TEXT		 NULL  COMMENT '商品別名',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='商品別名テーブル';

/**********************************/
/* テーブル名: おすすめ商品テーブル */
/**********************************/
CREATE TABLE recommend_tbl(
        product_id                    		INT(10)		 NULL 		 PRIMARY KEY COMMENT '商品ID',
        recommend_pic                 		VARCHAR(255)		 NULL  COMMENT 'おすすめ商品画像ファイル名',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='おすすめ商品テーブル';

/**********************************/
/* テーブル名: 商品画像テーブル */
/**********************************/
CREATE TABLE product_pic_tbl(
        product_id                    		INT(10)		 NULL  COMMENT '商品ID',
        pic_category                  		INT(10)		 NULL  COMMENT '画像カテゴリ',
        pic_number                    		INT(10)		 NULL  COMMENT 'サブ画像表示順',
        pic_file                      		VARCHAR(255)		 NULL  COMMENT '画像ファイル名',
  PRIMARY KEY (product_id, pic_category, pic_number),
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='商品画像テーブル';


CREATE INDEX index_key ON order_tbl (user_id);

CREATE INDEX index_key ON order_product_tbl (order_id);

CREATE INDEX index_key ON product_mst (category_id);

CREATE INDEX index_key ON review_tbl (product_id);



/*###########################################################################
 # データINSERT
 ############################################################################*/

/* hard_tbl */
INSERT INTO ecsite_db.hard_tbl ( hard_id, hard_name ) VALUES (1,'Nintendo Switch');
INSERT INTO ecsite_db.hard_tbl ( hard_id, hard_name ) VALUES (2,'PlayStation4');

/* category_tbl */
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (1,'RPG');
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (2,'アクション');
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (3,'シューティング');
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (4,'シミュレーション・ストラテジー');
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (5,'アドベンチャー');
INSERT INTO ecsite_db.category_tbl ( category_id, category_name ) VALUES (6,'その他');


/* personal_mst */
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('watarai','jun','渡来','ワタライ','09044444444','4444444','東京');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('nakatomi','miyuki','中冨','ナカトミ','09011111111','1111111','神奈川');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('takehara','saki','竹原','タケハラ','09022222222','2222222','福島');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('iyoku1','tetuya','伊能','イヨク','09033333333','3333333','群馬');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('agata1','kiratarou','安形','アガタ','0905555555','5555555','埼玉');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('kishino','takuya','岸野','キシノ','09000000000','6666666','栃木');


/* product_mst */
INSERT INTO ecsite_db.product_mst ( product_id, product_name, price, info, stocks, comment, hard_id, category_id, ave_eval, review_count ) VALUES (1,'CALL OF DUTY WWⅡ',7900,'商品説明<1>',999,'オスス&<>''\r\nメ1',2,3,1,11);
INSERT INTO ecsite_db.product_mst ( product_id, product_name, price, info, stocks, comment, hard_id, category_id, ave_eval, review_count ) VALUES (2,'MONSTER HUNTER WORLD',8980,'商品説明<2>',999,'オススメ2',2,2,2,12);
INSERT INTO ecsite_db.product_mst ( product_id, product_name, price, info, stocks, comment, hard_id, category_id, ave_eval, review_count ) VALUES (3,'A列車で行こうEXP.',7800,'商品説明<3>',999,'オススメ3',2,4,3,13);
INSERT INTO ecsite_db.product_mst ( product_id, product_name, price, info, stocks, comment, hard_id, category_id, ave_eval, review_count ) VALUES (4,'Splatoon2',5980,'商品説明<4>',999,'オススメ4',1,2,4,14);
INSERT INTO ecsite_db.product_mst ( product_id, product_name, price, info, stocks, comment, hard_id, category_id, ave_eval, review_count ) VALUES (5,'Xenoblade2',7980,'商品説明<5>',999,'オススメ5',1,1,5,15);



/*product_pic_tbl*/
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,0,0,'\\img\\logo\\COD.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,1,0,'\\img\\main\\COD.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,2,1,'\\img\\sub\\COD_Sub.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,2,2,'\\img\\sub\\COD_Sub2.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,2,3,'\\img\\sub\\COD_Sub3.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,2,4,'\\img\\sub\\COD_Sub4.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (1,2,5,'\\img\\sub\\COD_Sub5.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (2,0,0,'\\img\\logo\\MHW_rogo.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (2,1,0,'\\img\\main\\MHW.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (2,2,1,'\\img\\sub\\MHW_Sub.jsp');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (3,0,0,'\\img\\logo\\Arextusixya_logo.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (3,1,0,'\\img\\main\\Arextusixya.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (3,2,1,'\\img\\sub\\Arextusixya_Sub.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (4,0,0,'\\img\\logo\\Splatoon2_logo.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (4,1,0,'\\img\\main\\Splatoon2.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (4,2,1,'\\img\\sub\\Splatoon2_Sub.jsp');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (5,0,0,'\\img\\logo\\xenoblade2_logo.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (5,1,0,'\\img\\main\\Xenoblade2.jpg');
INSERT INTO ecsite_db.product_pic_tbl ( product_id, pic_category, pic_number, pic_file ) VALUES (5,2,1,'\\img\\sub\\Xenoblade2_Sub.jsp');


/*conversion_tbl*/
INSERT INTO ecsite_db.conversion_tbl ( product_id, conversion_word ) VALUES (1,'COD CODWW2 コールオブデューティー CALLOFDUTYWWⅡ');
INSERT INTO ecsite_db.conversion_tbl ( product_id, conversion_word ) VALUES (2,'MHW モンスターハンターワールド モンハンワールド MONSTERHUNTERWORLD');
INSERT INTO ecsite_db.conversion_tbl ( product_id, conversion_word ) VALUES (3,'A列車で行こうExp. A列車');
INSERT INTO ecsite_db.conversion_tbl ( product_id, conversion_word ) VALUES (4,'Splatoon2 スプラトゥーン2 イカ');
INSERT INTO ecsite_db.conversion_tbl ( product_id, conversion_word ) VALUES (5,'ゼノブレイド２ Xenoblade2');


/*recommend_tbl*/
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (1,'img\\osusume\\COD.png');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (2,'img\\osusume\\MHW.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (3,'img\\osusume\\Arextusixya.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (4,'img\\osusume\\Splatoopn2.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (5,'img\\osusume\\Xenoblade2.jpg');


/*order_tbl*/
INSERT INTO ecsite_db.order_tbl ( order_id, user_id, date, shipping ) VALUES (1,'nakatomi','2012-01-01 12:12:12',true);
INSERT INTO ecsite_db.order_tbl ( order_id, user_id, date, shipping ) VALUES (2,'iyoku1','2011-01-31 21:01:03',false);
INSERT INTO ecsite_db.order_tbl ( order_id, user_id, date, shipping ) VALUES (3,'takehara','2012-01-21 21:22:30',true);
INSERT INTO ecsite_db.order_tbl ( order_id, user_id, date, shipping ) VALUES (4,'agata1','2015-01-21 11:21:32',true);
INSERT INTO ecsite_db.order_tbl ( order_id, user_id, date, shipping ) VALUES (5,'watarai','2016-05-30 12:22:22',false);


/*order_product_tbl*/
INSERT INTO ecsite_db.order_product_tbl ( order_id, product_id, number ) VALUES (1,1,1);
INSERT INTO ecsite_db.order_product_tbl ( order_id, product_id, number ) VALUES (2,1,2);
INSERT INTO ecsite_db.order_product_tbl ( order_id, product_id, number ) VALUES (3,2,3);
INSERT INTO ecsite_db.order_product_tbl ( order_id, product_id, number ) VALUES (4,3,2);
INSERT INTO ecsite_db.order_product_tbl ( order_id, product_id, number ) VALUES (5,4,2);


/*revuew_tbl*/
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (1,1,'nakatomi',5,'面白かった&<>''\r\nです！','1988-08-10 13:49:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (2,2,'iyoku1',4,'結構面白かった','1988-01-20 13:22:34');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (3,1,'takehara',3,'普通でした','2000-01-01 23:22:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (4,3,'agata1',5,'最高ですー','2001-02-23 12:30:15');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (5,1,'watarai',2,'まぁまぁ','2001-12-31 13:24:24');


