#Cドライブ直下に配置した上で、下の命令を実行
#\. c:\ecsite_db\ecsite_db.sql

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
        nickname                       		VARCHAR(20)		 NULL  COMMENT 'ニックネーム',
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
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (1, 'RPG');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (2, 'アクション');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (3, 'シューティング');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (4, 'シミュレーション・ストラテジー');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (5, 'アドベンチャー');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (6, 'レース');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (8, 'その他');


/* personal_mst */
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('watarai','jun','渡来','ワタライ','09044444444','4444444','東京');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('nakatomi','miyuki','中冨','ナカトミ','09011111111','1111111','神奈川');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('takehara','saki','竹原','タケハラ','09022222222','2222222','福島');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('iyoku1','tetuya','伊能','イヨク','09033333333','3333333','群馬');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('agata1','kiratarou','安形','アガタ','0905555555','5555555','埼玉');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('kishino','takuya','岸野','キシノ','09000000000','6666666','栃木');


/* product_mst */
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (1, 'コールオブデューティーCALL OF DUTY WW�U', 7900, '「Call of Duty: WWII」はシリーズの原点に回帰――第二次世界大戦を舞台に、圧倒的な新世代のゲーム体験を味わえます。D-デイにノルマンディーに上陸し、史上最も大規模な戦争が繰り広げられたヨーロッパ各地の戦場で生き抜きます。従来の地に足のついたCall of Dutyの戦闘、仲間との絆、過酷な戦争を体感しましょう。', 999, 'ずどーーーーーん！ちゅどーーーーーん！！ばばばばーーーーーん！！！徹底的にリアリティを追求したFPS(ふぁーすとぱーそんしゅーてぃんぐ)の代表作です。FPSをこれから始めるならまず最初にやっておいた方がいいのではないかという1本！', 2, 3, 3, 3);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (2, 'ファイナルファンタジー15(FINALFANTASY15)', 8980, 'どこまでも広がる世界、どこまでも行ける世界：　広大な世界を自由に動き回って探索、攻略ができる「オープンワールド」形式を採用。時間経過、天候の変化により、世界の状況はリアルタイムで変化す る。笑い声が響く街並み、鳥たちが舞う草原、鬱蒼とした森、深く暗い洞窟──。目的地への移動も、世界の探索も全てプレイヤーの意志に委ねられます。', 999, '圧倒的なグラフィック！そして音楽はとても素晴らしいです。でも、でも・・・肝心なシナリオ部分が今回省略されている部分が多く、有料のDLCを購入してようやく話が繋がった感じ・・・DLC前提ではなく、製品版できちんとストーリーをすべて分かるようにしてほしかったです・・・(ﾟДﾟ)', 2, 1, 4, 2);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (3, 'ドラゴンクエスト11 (DRAGON QUEST XI)', 7800, '「ドラゴンクエスト」シリーズ11番目となる本編最新作は、シリーズの原点に立ち返り「勇者」の冒険を描いた物語。PlayStation (R) 4、ニンテンドー3DSの2つのプラットフォームで展開される、“懐かしさ"と“新しさ"を兼ね備えた、シリーズの「新たなる原点」となる11番目の冒険、『ドラゴンクエストXI』が、今ここに始まる。　あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ', 999, '言わずと知れた日本を代表するRPGの最新作が登場！ドラクエの凄いところはシリーズを通してずっと原作：堀井雄二、キャラクターデザイン：鳥山明、音楽：すぎやまこういちな所ですかね。大作だと時々期待はずれに終わってしまうソフトもありますが、常にある一定水準のクオリティを安心して楽しめます。買って損することはまずない。王道RPGです。', 2, 1, 5, 1);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (4, 'スプラトゥーン2', 5980, 'イカしたやつらがイカした進化！ガチで塗りあう時がきた！2017年7月21日（金）発売、Nintendo Switchソフト『スプラトゥーン2』', 999, 'イカしてる(/・ω・)/？FPSで相手を殺害するといったゲームが多い中、そういった銃をペンキに変えて楽しめるようにしたのがさすが任天堂！という感じの1本ですね。ゲームとしても完成されていて面白い！ただ唯一残念なのはオンラインが前提でオフラインでマリオカートのように画面分割して遊べないところが・・・次回作ではそこも改善してくれると尚良しだと思います( ^ω^ )', 1, 3, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (5, 'ゼノブレイド2 (Xenoblade2)', 7980, '果てしなく広がる雲海の上、超巨大生物「巨神獣(アルス)」が行きかう世界「アルスト」。', 999, 'ゼノギアス、セノサーガに続くゼノブレイドシリーズの第2弾！グラフィックはFF等と比較すると見劣りする部分はありますが、これだけの広大な世界は逆にFFやDQにはない世界です。ゲームはグラフィックではなく最終的には楽しいかどうかが大事です。しかしゼノギアスは楽しかったなぁ・・・でも人肉缶詰工場は未だにトラウマ・・・', 1, 1, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (6, 'マリオカートデラックス8', 5980, '『マリオカート8』は、任天堂より2014年5月29日に発売されたWii U用ゲームソフト。家庭用向けのマリオカートシリーズとしては8作目にあたる。 ', 999, 'はっきり言おう。私はマリオカートがめちゃくちゃ下手くそだと( ^ω^ )！もはや外れなしの定番レーシングゲーム♪4画面分割で4人友達とオフライン対戦ができるのはやっぱり盛り上がりますね。クリスマスとか正月にみんなでワイワイやると楽しそうです☆', 1, 6, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (7, 'スーパーマリオオデッセイ', 5980, 'クッパとピーチ姫のウェディングを阻止するため、マリオが不思議な帽子キャッピーと一緒に世界中を冒険する3Dアクションゲーム。', 999, '随所に任天堂らしさが散りばめられておりとても楽しいです☆ただ長時間やっていると目が疲れます。。。', 1, 2, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (8, 'ペルソナ5 (Persona5)', 8800, '前作『ペルソナ４』から約8年。｢ペルソナ｣シリーズのナンバリング最新作であるPlayStaion4ソフトウェア『ペルソナ５』が、ついに発売。', 999, '独特な世界観とかデザインがステキな作品です。最近ではFF、ドラクエに次ぐ3作目の大作RPGなんて呼ばれるようにもなって来ました( ^ω^ )！世界での評価も高いようなので、今後のペルソナシリーズにますます期待大です♪', 2, 1, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (9, 'ゼルダの伝説 ブレス オブ ザ ワイルド', 6980, 'ハイラル王国は遙か昔、神話の時代から、何度も何度も魔王ガノンの厄災に見舞われてきた。その度に退魔の力を持つ騎士と、聖なる力を持つ姫によって封印されてきた。', 999, 'やって損などなし！', 1, 1, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (10, 'バイオハザード7 (BIO HAZARD 7)', 7990, 'すべては“恐怖"のために。新生するバイオハザード7。', 999, 'ちびります・・・', 2, 5, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (11, 'マインクラフト(Minecraft)', 2592, '箱庭のような1つの世界の中に用意された素材やアイテムを用いて、自由に遊び方を考え、実行できるサンドボックス型ゲーム。広大な世界は立方体のブロックでできている。ブロックを設置して何かを作るもブロックを壊して素材を入手するもプレイヤー次第。暗い夜や洞窟にはたくさんのモンスターが待ち構えている。世界のどこかにはモンスターや宝が眠る「異世界」があるという噂も。', 999, '一人で延々と楽しむ感じのゲームですね前にこれと似たようなゲームをパソコンでやった事があるのですがPS4にもあったのは、知らなかったです。値段がとにかく安いので、気軽に楽しんでできるコストパフォーマンスがいいですね。', 2, 4, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (12, 'アンチャーテッド4(Uncharted4)', 4900, '18世紀に存在した海賊王「ヘンリー・エイブリー」の秘宝が眠る海賊たちの国を目指して冒険するアクションアドベンチャー。さまざまな場所を登り、飛び、鉤付きロープを引っ掛けるなど、「アンチャーテッド」シリーズならではのアクションを楽しめる。マルチプレイでは、ピンチのときにプレイヤーを助ける仲間を呼び出すことができ、神秘的な秘宝を使って超自然的能力も使える。', 999, 'プレイする映画とまで言わており、高評価のようですが、個人的にはそんなにストーリーに没頭させれる、引き込んでくるような事はありませんでした。今までいろんなオープンワールドタイプのゲームをプレイしたせいか、窮屈に感じます。この当たりは、個人差があるので、なんとも言えませんが、PSユーザーにも高評価らしいですが、一部に人にはそんな大作とは思わない人達もいるかと思います。決して、つまらないゲームではないですが、またプレイしたい、またプレイとまでは思わないゲームと私は感じました。', 2, 2, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (13, 'マインクラフト(Minecraft)', 2592, '箱庭のような1つの世界の中に用意された素材やアイテムを用いて、自由に遊び方を考え、実行できるサンドボックス型ゲーム。広大な世界は立方体のブロックでできている。ブロックを設置して何かを作るもブロックを壊して素材を入手するもプレイヤー次第。暗い夜や洞窟にはたくさんのモンスターが待ち構えている。世界のどこかにはモンスターや宝が眠る「異世界」があるという噂も。', 999, '一人で延々と楽しむ感じのゲームですね前にこれと似たようなゲームをパソコンでやった事があるのですがPS4にもあったのは、知らなかったです。値段がとにかく安いので、気軽に楽しんでできるコストパフォーマンスがいいですね。', 1, 4, 0, 0);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (14, 'ARMS(アームズ)', 4980, '手の動きに合わせてファイターが動き、のびるウデ「アーム」でパンチや多彩なアクションを繰り出す格闘スポーツ。能力の異なる個性豊かなファイターたちと、左右別々に付け替えられるアームの組み合わせで、自分好みのスタイルや戦術を追求。相手をリングに放り込む「バスケット」や、「バレーボール」「マトアテ」「100人組手」など、ARMS能力を生かしたゲームを収録。', 999, '操作に若干クセがあるけどJoy-Conをもって体を動かしているだけで楽しく、いかにもSwitchらしいゲーム。遊ぶとほかのゲームより疲れることを配慮しつつも、Switchらしいゲームを探している人は最初に選ぶべきゲームだと思います。', 1, 2, 0, 0);


/*product_pic_tbl*/
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 0, 0, 'img\\logo\\COD2_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 1, 0, 'img\\main\\COD2_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 2, 1, 'img\\sub\\COD2_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 2, 2, 'img\\sub\\COD2_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 2, 3, 'img\\sub\\COD2_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 2, 4, 'img\\sub\\COD2_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (1, 2, 5, 'img\\sub\\COD2_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 0, 0, 'img\\logo\\FF15_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 1, 0, 'img\\main\\FF15_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 2, 1, 'img\\sub\\FF15_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 2, 2, 'img\\sub\\FF15_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 2, 3, 'img\\sub\\FF15_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 2, 4, 'img\\sub\\FF15_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (2, 2, 5, 'img\\sub\\FF15_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 0, 0, 'img\\logo\\DQ11_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 1, 0, 'img\\main\\DQ11_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 2, 1, 'img\\sub\\DQ11_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 2, 2, 'img\\sub\\DQ11_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 2, 3, 'img\\sub\\DQ11_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 2, 4, 'img\\sub\\DQ11_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (3, 2, 5, 'img\\sub\\DQ11_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 0, 0, 'img\\logo\\Splatoon2_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 1, 0, 'img\\main\\Splatoon2_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 2, 1, 'img\\sub\\Splatoon2_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 2, 2, 'img\\sub\\Splatoon2_Sub2.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 2, 3, 'img\\sub\\Splatoon2_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 2, 4, 'img\\sub\\Splatoon2_Sub4.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (4, 2, 5, 'img\\sub\\Splatoon2_Sub5.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 0, 0, 'img\\logo\\Xenoblade2_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 1, 0, 'img\\main\\Xenoblade2_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 2, 1, 'img\\sub\\Xenoblade2_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 2, 2, 'img\\sub\\Xenoblade2_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 2, 3, 'img\\sub\\Xenoblade2_Sub3.PNG');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 2, 4, 'img\\sub\\Xenoblade2_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (5, 2, 5, 'img\\sub\\Xenoblade2_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 0, 0, 'img\\logo\\MarioCart8_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 1, 0, 'img\\main\\MarioCart8_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 2, 1, 'img\\sub\\MarioCart8_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 2, 2, 'img\\sub\\MarioCart8_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 2, 3, 'img\\sub\\MarioCart8_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 2, 4, 'img\\sub\\MarioCart8_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (6, 2, 5, 'img\\sub\\MarioCart8_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 0, 0, 'img\\logo\\Mario_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 1, 0, 'img\\main\\Mario_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 2, 1, 'img\\sub\\Mario_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 2, 2, 'img\\sub\\Mario_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 2, 3, 'img\\sub\\Mario_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 2, 4, 'img\\sub\\Mario_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (7, 2, 5, 'img\\sub\\Mario_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 0, 0, 'img\\logo\\Persona5_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 1, 0, 'img\\main\\Persona5_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 2, 1, 'img\\sub\\Persona5_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 2, 2, 'img\\sub\\Persona5_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 2, 3, 'img\\sub\\Persona5_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 2, 4, 'img\\sub\\Persona5_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (8, 2, 5, 'img\\sub\\Persona5_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 0, 0, 'img\\logo\\Zelda_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 1, 0, 'img\\main\\Zelda_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 2, 1, 'img\\sub\\Zelda_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 2, 2, 'img\\sub\\Zelda_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 2, 3, 'img\\sub\\Zelda_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 2, 4, 'img\\sub\\Zelda_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (9, 2, 5, 'img\\sub\\Zelda_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 0, 0, 'img\\logo\\BIO7_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 1, 0, 'img\\main\\BIO7_main_.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 2, 1, 'img\\sub\\Bio7_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 2, 2, 'img\\sub\\Bio7_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 2, 3, 'img\\sub\\Bio7_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 2, 4, 'img\\sub\\Bio7_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (10, 2, 5, 'img\\sub\\Bio7_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 0, 0, 'img\\logo\\Minecraft_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 1, 0, 'img\\main\\Minecraft_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 2, 1, 'img\\sub\\Minecraft_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 2, 2, 'img\\sub\\Minecraft_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 2, 3, 'img\\sub\\Minecraft_Sub3.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 2, 4, 'img\\sub\\Minecraft_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (11, 2, 5, 'img\\sub\\Minecraft_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 0, 0, 'img\\logo\\Uncharted4_logo.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 1, 0, 'img\\main\\Uncharted4_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 2, 1, 'img\\sub\\Uncharted4_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 2, 2, 'img\\sub\\Uncharted4_Sub2.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 2, 3, 'img\\sub\\Uncharted4_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 2, 4, 'img\\sub\\Uncharted4_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (12, 2, 5, 'img\\sub\\Uncharted4_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 0, 0, 'img\\logo\\Minecraft_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 1, 0, 'img\\main\\Minecraft_switch_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 2, 1, 'img\\sub\\Minecraft_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 2, 2, 'img\\sub\\Minecraft_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 2, 3, 'img\\sub\\Minecraft_Sub3.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 2, 4, 'img\\sub\\Minecraft_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (13, 2, 5, 'img\\sub\\Minecraft_Sub5.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 0, 0, 'img\\logo\\Arms_logo.png');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 1, 0, 'img\\main\\Arms_main.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 2, 1, 'img\\sub\\Arms_Sub.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 2, 2, 'img\\sub\\Arms_Sub2.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 2, 3, 'img\\sub\\Arms_Sub3.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 2, 4, 'img\\sub\\Arms_Sub4.jpg');
INSERT INTO `product_pic_tbl` (`product_id`, `pic_category`, `pic_number`, `pic_file`) VALUES (14, 2, 5, 'img\\sub\\Arms_Sub5.jpg');


/*conversion_tbl*/
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (1, 'COD CODWW2 コールオブデューティー CALLOFDUTYWW�U');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (2, 'FF15  ファイナルファンタジー15　FINAL FANTASY ファイファン');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (3, 'DQ11　ドラゴンクエスト11　DRAGON QUEST 11');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (4, 'Splatoon2 スプラトゥーン2 イカ');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (5, 'ゼノブレイド２ Xenoblade2　ゼノギアス　ゼノサーガ');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (6, 'マリオカートデラックス8  Mario Cart Deluxe8　マリカ');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (7, 'スーパーマリオオデッセイ　Super Mario Odyssey　スーマリ');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (8, 'ペルソナ　ペルソナ5　Persona5');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (9, 'ゼルダの伝説 ブレス オブ ザ ワイルド Legend of Zelda');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (10, 'biohazard7 バイオ　resident evil 7 バイオハザード');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (11, 'マイクラ　マインクラフト　Minecraft');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (12, 'アンチャ　アンチャーテッド　Uncharted　アンチャ4');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (14, 'アームズ　arms');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (13, 'マイクラ　マインクラフト　Minecraft');


/*recommend_tbl*/
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (1, 'img\\reccomend\\COD2_image.png');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (2, 'img\\reccomend\\FF15_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (3, 'img\\reccomend\\DQ11_image.png');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (4, 'img\\reccomend\\Splatoopn2_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (5, 'img\\reccomend\\Xenoblade2_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (6, 'img\\reccomend\\MarioCart8_image.png');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (7, 'img\\reccomend\\Mario_image.png');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (8, 'img\\reccomend\\Persona5_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (9, 'img\\reccomend\\Zelda_image.png');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (10, 'img\\reccomend\\BIO7_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (11, 'img\\reccomend\\Minecraft_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (12, 'img\\reccomend\\Uncharted4_image.jpg');
INSERT INTO `recommend_tbl` (`product_id`, `recommend_pic`) VALUES (14, 'img\\reccomend\\Arms_image.png');


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
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (1,1,'nakatomi','中冨',5,'<面白かった>です！','1988-08-10 13:49:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (2,2,'iyoku1','伊能',4,'結構面白かった','1988-01-20 13:22:34');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (3,1,'takehara','竹原',3,'普通でした','2000-01-01 23:22:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (4,3,'agata1','安形',5,'最高ですー','2001-02-23 12:30:15');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (5,1,'watarai','渡来',2,'まぁまぁ','2001-12-31 13:24:24');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, nickname, evaluation, review, date ) VALUES (6,2,'takehara','竹',5,'やりたいやりたい','2017-12-18 10:32:08');


