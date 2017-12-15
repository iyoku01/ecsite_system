/*###########################################################################
 # DB�쐬
 ############################################################################*/
DROP DATABASE IF EXISTS ecsite_db;
CREATE DATABASE ecsite_db;
USE ecsite_db;


/*###########################################################################
 # TABLE�쐬
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
/* �e�[�u����: �J�e�S���[�e�[�u�� */
/**********************************/
CREATE TABLE category_tbl(
        category_id                   		INT(10)		 NOT NULL		 PRIMARY KEY COMMENT '�J�e�S���[ID',
        category_name                 		VARCHAR(20)		 NULL  COMMENT '�J�e�S���[��'
) COMMENT='�J�e�S���[�e�[�u��';

/**********************************/
/* �e�[�u����: �l���}�X�^ */
/**********************************/
CREATE TABLE personal_mst(
        user_id                       		CHAR(10)		 NOT NULL		 PRIMARY KEY COMMENT '���[�U�[ID',
        password                      		VARCHAR(24)		 NULL  COMMENT '�p�X���[�h',
        name                          		VARCHAR(30)		 NULL  COMMENT '���O',
        nickname                      		VARCHAR(20)		 NULL  COMMENT '�j�b�N�l�[��',
        phone                         		CHAR(12)		 NULL  COMMENT '�d�b�ԍ�',
        postal_code                   		CHAR(7)		 NULL  COMMENT '�X�֔ԍ�',
        address                       		VARCHAR(50)		 NULL  COMMENT '�Z��'
) COMMENT='�l���}�X�^';

/**********************************/
/* �e�[�u����: �����e�[�u�� */
/**********************************/
CREATE TABLE order_tbl(
        order_id                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '�����ԍ�',
        user_id                       		CHAR(10)		 NULL  COMMENT '���[�U�[��',
        date                          		DATETIME		 NULL  COMMENT '��������',
        shipping                      		BIT		 DEFAULT 1		 NULL  COMMENT '�����t���O',
  FOREIGN KEY (user_id) REFERENCES personal_mst (user_id)
) COMMENT='�����e�[�u��';

/**********************************/
/* �e�[�u����: �������e�e�[�u�� */
/**********************************/
CREATE TABLE order_product_tbl(
        order_id                      		INT(10)		 NOT NULL COMMENT '�����ԍ�',
        product_id                    		INT(10)		 NOT NULL COMMENT '���i�ԍ�',
        number                        		INT(10)		 NULL  COMMENT '��',
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES order_tbl (order_id)
) COMMENT='�������e�e�[�u��';

/**********************************/
/* �e�[�u����: �n�[�h�e�[�u�� */
/**********************************/
CREATE TABLE hard_tbl(
        hard_id                       		INT(10)		 NULL 		 PRIMARY KEY COMMENT '�n�[�hID',
        hard_name                     		VARCHAR(20)		 NULL  COMMENT '�n�[�h��'
) COMMENT='�n�[�h�e�[�u��';

/**********************************/
/* �e�[�u����: ���i�}�X�^ */
/**********************************/
CREATE TABLE product_mst(
        product_id                    		INT(10)		 NOT NULL		 PRIMARY KEY COMMENT '���iID',
        product_name                  		VARCHAR(30)		 NULL  COMMENT '���i��',
        price                         		INT(10)		 NULL  COMMENT '���z',
        info                       		TEXT		 NULL  COMMENT '���i����',
        stocks                        		MEDIUMINT(10)		 NULL  COMMENT '�݌ɐ�',
        comment                       		TEXT		 NULL  COMMENT '�R�����g',
        hard_id                       		INT(10)		 NULL  COMMENT '�n�[�hID',
        category_id                   		INT(10)		 NULL  COMMENT '�J�e�S���[ID',
        ave_eval                      		FLOAT(10)		 NULL  COMMENT '���ϕ]��',
        review_count                  		MEDIUMINT(10)		 NULL  COMMENT '���r���[��',
  FOREIGN KEY (category_id) REFERENCES category_tbl (category_id),
  FOREIGN KEY (hard_id) REFERENCES hard_tbl (hard_id)
) COMMENT='���i�}�X�^';

/**********************************/
/* �e�[�u����: ���r���[�e�[�u�� */
/**********************************/
CREATE TABLE review_tbl(
        review_id                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '���r���[ID',
        product_id                    		INT(10)		 NULL  COMMENT '���iID',
        user_id                       		VARCHAR(10)		 NULL  COMMENT '���[�U�[ID',
        evaluation                    		INT(1)		 NULL  COMMENT '�]��',
        review                        		TEXT		 NULL  COMMENT '���r���[',
        date                          		DATETIME		 NULL  COMMENT '���r���[����',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id),
  FOREIGN KEY (user_id) REFERENCES personal_mst (user_id)
) COMMENT='���r���[�e�[�u��';

/**********************************/
/* �e�[�u����: ���i�ʖ��e�[�u�� */
/**********************************/
CREATE TABLE conversion_tbl(
        product_id                    		INT(10)		 NULL 		 PRIMARY KEY COMMENT '���iID',
        conversion_word               		TEXT		 NULL  COMMENT '���i�ʖ�',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='���i�ʖ��e�[�u��';

/**********************************/
/* �e�[�u����: �������ߏ��i�e�[�u�� */
/**********************************/
CREATE TABLE recommend_tbl(
        product_id                    		INT(10)		 NULL 		 PRIMARY KEY COMMENT '���iID',
        recommend_pic                 		VARCHAR(255)		 NULL  COMMENT '�������ߏ��i�摜�t�@�C����',
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='�������ߏ��i�e�[�u��';

/**********************************/
/* �e�[�u����: ���i�摜�e�[�u�� */
/**********************************/
CREATE TABLE product_pic_tbl(
        product_id                    		INT(10)		 NULL  COMMENT '���iID',
        pic_category                  		INT(10)		 NULL  COMMENT '�摜�J�e�S��',
        pic_number                    		INT(10)		 NULL  COMMENT '�T�u�摜�\����',
        pic_file                      		VARCHAR(255)		 NULL  COMMENT '�摜�t�@�C����',
  PRIMARY KEY (product_id, pic_category, pic_number),
  FOREIGN KEY (product_id) REFERENCES product_mst (product_id)
) COMMENT='���i�摜�e�[�u��';


CREATE INDEX index_key ON order_tbl (user_id);

CREATE INDEX index_key ON order_product_tbl (order_id);

CREATE INDEX index_key ON product_mst (category_id);

CREATE INDEX index_key ON review_tbl (product_id);



/*###########################################################################
 # �f�[�^INSERT
 ############################################################################*/

/* hard_tbl */
INSERT INTO ecsite_db.hard_tbl ( hard_id, hard_name ) VALUES (1,'Nintendo Switch');
INSERT INTO ecsite_db.hard_tbl ( hard_id, hard_name ) VALUES (2,'PlayStation4');

/* category_tbl */
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (1, 'RPG');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (2, '�A�N�V����');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (3, '�V���[�e�B���O');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (4, '�V�~�����[�V�����E�X�g���e�W�[');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (5, '�A�h�x���`���[');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (6, '���[�X');
INSERT INTO `category_tbl` (`category_id`, `category_name`) VALUES (8, '���̑�');


/* personal_mst */
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('watarai','jun','�n��','���^���C','09044444444','4444444','����');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('nakatomi','miyuki','���y','�i�J�g�~','09011111111','1111111','�_�ސ�');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('takehara','saki','�|��','�^�P�n��','09022222222','2222222','����');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('iyoku1','tetuya','�ɔ\','�C���N','09033333333','3333333','�Q�n');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('agata1','kiratarou','���`','�A�K�^','0905555555','5555555','���');
INSERT INTO ecsite_db.personal_mst ( user_id, password, name, nickname, phone, postal_code, address ) VALUES ('kishino','takuya','�ݖ�','�L�V�m','09000000000','6666666','�Ȗ�');


/* product_mst */
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (1, 'CALL OF DUTY WW�U', 7900, '�uCall of Duty: WWII�v�̓V���[�Y�̌��_�ɉ�A�\�\��񎟐��E���𕑑�ɁA���|�I�ȐV����̃Q�[���̌��𖡂킦�܂��BD-�f�C�Ƀm���}���f�B�[�ɏ㗤���A�j��ł���K�͂Ȑ푈���J��L����ꂽ���[���b�p�e�n�̐��Ő��������܂��B�]���̒n�ɑ��̂���Call of Duty�̐퓬�A���ԂƂ��J�A�ߍ��Ȑ푈��̊����܂��傤�B', 999, '���X���R�����g�@�푈���[�[�[�[�[�[�[�[�[�[�[�[�I�I�I�łđłĂ��Ă����������������I�I�I�I', 2, 3, 1, 11);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (2, 'FINAL FANTASY 15', 8980, '�ǂ��܂ł��L���鐢�E�A�ǂ��܂ł��s���鐢�E�F�@�L��Ȑ��E�����R�ɓ�������ĒT���A�U�����ł���u�I�[�v�����[���h�v�`�����̗p�B���Ԍo�߁A�V��̕ω��ɂ��A���E�̏󋵂̓��A���^�C���ŕω��� ��B�΂����������X���݁A�����������������A�T���Ƃ����X�A�[���Â����A�����B�ړI�n�ւ̈ړ����A���E�̒T�����S�ăv���C���[�̈ӎu�Ɉς˂��܂��B', 999, '���X���R�����g�@���|�I�ȃO���t�B�b�N�B���y�͂ƂĂ��f���炵���ł��B�ł��A�ł��E�E�E�̐S�ȃX�g�[���[�������ȗ�����Ă��镔���������ADLC�ł悤�₭�b���q�����������E�E�E���i�łŃX�g�[���[��������悤�ɂ��Ăق��������ł��B', 2, 2, 2, 12);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (3, 'DRAGON QUEST 11', 7800, '�u�h���S���N�G�X�g�v�V���[�Y11�ԖڂƂȂ�{�ҍŐV��́A�V���[�Y�̌��_�ɗ����Ԃ�u�E�ҁv�̖`����`��������BPlayStation (R) 4�A�j���e���h�[3DS��2�̃v���b�g�t�H�[���œW�J�����A�g��������"�Ɓg�V����"�����˔������A�V���[�Y�́u�V���Ȃ錴�_�v�ƂȂ�11�Ԗڂ̖`���A�w�h���S���N�G�X�gXI�x���A�������Ɏn�܂�B', 999, '���X���R�����g�@�A�o�[�[�[�[�[�[�[�[�[�[�[�[�[���B�X�g���[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�[�b�V��(/�E�ցE)/�I�I�I�I', 2, 4, 3, 13);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (4, '�X�v���g�D�[��2', 5980, '�C�J������炪�C�J�����i���I�K�`�œh�肠�����������I2017�N7��21���i���j�����ANintendo Switch�\�t�g�w�X�v���g�D�[��2�x', 999, '���X���R�����g�@�C�J���Ă�(/�E�ցE)/�H', 1, 2, 4, 14);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (5, 'Xenoblade2', 7980, '�s�����A�y���ցI', 999, '���X���R�����g�@�[�m�M�A�X�͊y���������Ȃ��E�E�E�l���ʋl�H��̓g���E�}�E�E�E', 1, 1, 5, 15);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (6, '�}���I�J�[�g�f���b�N�X8', 5980, '�w�}���I�J�[�g8�x�́A�C�V�����2014�N5��29���ɔ������ꂽWii U�p�Q�[���\�t�g�B�ƒ�p�����̃}���I�J�[�g�V���[�Y�Ƃ��Ă�8��ڂɂ�����B ', 999, '���X���R�����g�@�͂����茾�����B���̓}���I�J�[�g���߂��Ⴍ���ቺ�肭���Ȃ̂ł��E�E�E', 1, 6, 1, 16);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (7, '�X�[�p�[�}���I�I�f�b�Z�C', 5980, '�N�b�p�ƃs�[�`�P�̃E�F�f�B���O��j�~���邽�߁A�}���I���s�v�c�ȖX�q�L���b�s�[�ƈꏏ�ɐ��E����`������3D�A�N�V�����Q�[���B', 999, '���X���R�����g�@�����ɔC�V���炵�����U��΂߂��Ă���ƂĂ��y�����ł������������Ԃ���Ă���Ɩڂ����܂��B�B�B', 1, 2, 2, 17);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (8, '�y���\�i5', 8800, '�O��w�y���\�i�S�x�����8�N�B��y���\�i��V���[�Y�̃i���o�����O�ŐV��ł���PlayStaion4�\�t�g�E�F�A�w�y���\�i�T�x���A���ɔ����B', 999, '���X���R�����g�@�Ɠ��Ȑ��E�ςƂ��f�U�C���Ƃ��n�}��l�ɂ̓n�}��ł��傤�˂��E�E�E( ^��^ )', 2, 1, 3, 18);
INSERT INTO `product_mst` (`product_id`, `product_name`, `price`, `info`, `stocks`, `comment`, `hard_id`, `category_id`, `ave_eval`, `review_count`) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


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


/*conversion_tbl*/
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (1, 'COD CODWW2 �R�[���I�u�f���[�e�B�[ CALLOFDUTYWW�U');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (2, 'FF15  �t�@�C�i���t�@���^�W�[15�@FINAL FANTASY 15');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (3, 'DQ11�@�h���S���N�G�X�g11�@DRAGON QUEST 11');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (4, 'Splatoon2 �X�v���g�D�[��2');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (5, '�[�m�u���C�h�Q Xenoblade2');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (6, '�}���I�J�[�g�f���b�N�X8  Mario Cart Deluxe8');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (7, '�X�[�p�[�}���I�I�f�b�Z�C�@Super Mario Odyssey');
INSERT INTO `conversion_tbl` (`product_id`, `conversion_word`) VALUES (8, '�y���\�i5�@Persona5');


/*recommend_tbl*/
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (1,'img\\reccomend\\COD_image.png');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (2,'img\\reccomend\\MHW.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (3,'img\\reccomend\\Arextusixya.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (4,'img\\reccomend\\Splatoopn2.jpg');
INSERT INTO ecsite_db.recommend_tbl ( product_id, recommend_pic ) VALUES (5,'img\\reccomend\\Xenoblade2.jpg');


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
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (1,1,'nakatomi',5,'�ʔ�������&<>''\r\n�ł��I','1988-08-10 13:49:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (2,2,'iyoku1',4,'���\�ʔ�������','1988-01-20 13:22:34');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (3,1,'takehara',3,'���ʂł���','2000-01-01 23:22:22');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (4,3,'agata1',5,'�ō��ł��[','2001-02-23 12:30:15');
INSERT INTO ecsite_db.review_tbl ( review_id, product_id, user_id, evaluation, review, date ) VALUES (5,1,'watarai',2,'�܂��܂�','2001-12-31 13:24:24');


