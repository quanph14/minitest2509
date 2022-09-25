use quanlyvattu;
-- Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
DELIMITER //
CREATE PROCEDURE finalTotalAmount(IN mavattu varchar(45))
	BEGIN
		SELECT	
        mavattu, 
        (tonkho.soluongdau + tonkho.tongsoluongnhap - tonkho_tongsoluongxuat) AS soluongcuoicung
        FROM Vattu 
        JOIN TonKho ON Vattu.id = tonkho.vattu_id WHERE	vattu.mavattu = mavattu;
	END //
DELIMITER ;

-- Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.

DELIMITER //
CREATE PROCEDURE finalTotalAmountOut(IN	mavattu	varchar(45))
	BEGIN
			SELECT	
            vattu.mavattu, 
            vattu.tenvattu,
            chitietphieuxuat.soluongxuat * chitietphieuxuat.dongiaxuat AS tongtienxuat
            FROM vattu
            JOIN chitietphieuxuat ON vattu.id = chitietphieuxuat.vattu_id
            WHERE vattu.mavattu = mavattu;
	END //
DELIMITER ;

CALL	finalTotalAmountOut ('XM');

-- Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào.
DELIMITER //
CREATE PROCEDURE totalOrderQuantity (IN donhang_id INT)
	BEGIN
			SELECT	
            chitietdonhang.donhang_id, 
            SUM(chitietdonhang.soluongdat)
            FROM chitietdonhang 
            GROUP BY chitietdonhang.donhang_id;
	END //
DELIMITER ;

CALL totalOrderQuantity(1);

-- Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
DELIMITER //
CREATE PROCEDURE addOrder (IN id INT, IN madon VARCHAR(45),IN ngaydathang DATETIME,IN nhacungcap_id	INT)
	BEGIN
			INSERT INTO	dondathang (id, madon, ngaydathang, nhacungcap_id)
					VALUES (id, madon, ngaydathang, nhacungcap_id);
	END //
DELIMITER ;

CALL	addOrder(5,'HD01', '2022-10-24', '2'); 


-- Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
DELIMITER //
CREATE PROCEDURE addOrderDetails ( IN id INT, IN donhang_id INT, IN	vattu_id INT, IN soluongdat INT)
	BEGIN
			INSERT INTO	chitietdonhang (id, donhang_id, vattu_id, soluongdat)
					VALUES (id, donhang_id, vattu_id, soluongdat);
	END //
DELIMITER ;

CALL	addOrderDetails (7, 1, 3, 8);