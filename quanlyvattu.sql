use quanlyvattu;
-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW 	vw_CTPhieuNhap AS
SELECT 	
chitietphieunhap.phieunhap_id, 
vattu.mavattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap 
FROM chitietphieunhap
join vattu ON chitietphieunhap.vattu_id = vattu.id;
SELECT 	* FROM 	vw_CTPhieuNhap;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
create view vw_CTPNHAP_VT as 
SELECT 	
chitietphieunhap.phieunhap_id, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap 
FROM chitietphieunhap 
JOIN vattu ON chitietphieunhap.vattu_id = vattu.id;
SELECT 	* FROM vw_CTPhieuNhap_VT;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPhieuNhap_VT_PN AS
SELECT 	
chitietphieunhap.phieunhap_id, 
phieunhap.ngaynhap, 
phieunhap.donhang_id, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap 
FROM chitietphieunhap 
JOIN vattu ON chitietphieunhap.vattu_id = vattu.id 
JOIN phieunhap ON chitietphieunhap.phieunhap_id = phieunhap.id;
SELECT 	* FROM vw_CTPhieuNhap_VT_PN;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPhieuNhap_VT_PN_DH AS
SELECT 	
chitietphieunhap.phieunhap_id, 
phieunhap.ngaynhap, 
dondathang.id, 
dondathang.nhacungcap_id, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap
FROM chitietphieunhap 
JOIN phieunhap ON	chitietphieunhap.phieunhap_id = phieunhap.id
JOIN vattu ON chitietphieunhap.vattu_id = vattu.id
JOIN dondathang ON phieunhap.donhang_id = dondathang.id;
SELECT	* FROM	vw_CTPhieuNhap_VT_PN_DH;

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 2000.
CREATE VIEW vw_CTPhieuNhap_loc AS
SELECT	
chitietphieunhap.phieunhap_id, 
vattu.mavattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap
FROM chitietphieunhap
JOIN vattu ON chitietphieunhap.vattu_id = vattu.id
WHERE chitietphieunhap.soluongnhap > 2000;
SELECT	* FROM	vw_CTPhieuNhap_loc;

-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là khối.
CREATE VIEW vw_CTPhieuNhap_VT_loc AS
SELECT	
chitietphieunhap.phieunhap_id, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieunhap.soluongnhap, 
chitietphieunhap.dongianhap, 
(chitietphieunhap.dongianhap * chitietphieunhap.soluongnhap) AS thanhtiennhap
FROM chitietphieunhap
JOIN vattu ON chitietphieunhap.vattu_id = vattu.id
WHERE	vattu.donvitinh = 'khối';
SELECT	* FROM	vw_CTPhieuNhap_VT_loc;

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPhieuXuat AS
SELECT	
chitietphieuxuat.phieuxuat_id, 
vattu.mavattu, 
chitietphieuxuat.soluongxuat, 
chitietphieuxuat.dongiaxuat, 
(chitietphieuxuat.soluongxuat * chitietphieuxuat.dongiaxuat) AS thanhtienxuat
FROM chitietphieuxuat
JOIN vattu ON chitietphieuxuat.vattu_id = vattu.id;
SELECT	* FROM	vw_CTPhieuXuat;

-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPhieuXuat_VT AS
SELECT	
chitietphieuxuat.phieuxuat_id, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieuxuat.soluongxuat,
chitietphieuxuat.dongiaxuat, 
(chitietphieuxuat.soluongxuat * chitietphieuxuat.dongiaxuat) AS thanhtienxuat
FROM chitietphieuxuat
JOIN vattu ON chitietphieuxuat.vattu_id = vattu.id;
SELECT	* FROM vw_CTPhieuXuat_VT;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPhieuXuat_VT_PX AS
SELECT	
chitietphieuxuat.phieuxuat_id,
phieuxuat.tenkhachhang, 
vattu.mavattu, 
vattu.tenvattu, 
chitietphieuxuat.soluongxuat,
chitietphieuxuat.dongiaxuat, 
(chitietphieuxuat.soluongxuat * chitietphieuxuat.dongiaxuat) AS thanhtienxuat
FROM chitietphieuxuat
JOIN vattu ON chitietphieuxuat.vattu_id = vattu.id
JOIN phieuxuat ON chitietphieuxuat.phieuxuat_id = phieuxuat.id;
SELECT * FROM vw_CTPhieuXuat_VT_PX;