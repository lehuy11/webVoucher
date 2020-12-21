<div style="margin:30px auto;width: 90%;">
    <div class="row">
        <div class="col-sm-12">
            <h2>Cẩn Thận Khi Nhập Liệu</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Discount</th>
                        <th>Hạn Đến</th>
                        <th>Hình</th>
                        <th>Nút Sửa</th>
                        <th>Nút Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($xem['voucher'] as $k => $v) {


                    ?>
                        <tr>
                            <td><?php echo $v['id']; ?></td>
                            <td><?php echo $v['name']; ?></td>
                            <td><?php echo $v['gia']; ?></td>
                            <td><?php echo $v['discount']; ?></td>
                            <td><?php echo $v['han']; ?></td>
                            <td><img src="../image/<?php echo $v["image_link"]; ?>" class="img-responsive" style="width:50%;height: 100px;" alt="Image"></td>
                            <th>Sửa</th>
                            <th>Xóa</th>
                        </tr>
                    <?php


                    }
                    ?>
                </tbody>
            </table>


        </div>
    </div>


</div>
</div>
</div>
</div>