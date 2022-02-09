<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Tạo mới phiếu nhập </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Mã phiếu nhập"
        :rules="rules"
        v-model="cateId"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="cateName" label="Nội dung nhập hàng"></v-text-field>
      <v-text-field :rules="rules" v-model="cateName" label="Người tạo"></v-text-field>
      <v-textarea
        solo
        name="input-7-4"
        value=""
        label="Ghi chú"
      ></v-textarea>
      <v-text-field :rules="rules" v-model="updateDate" label="Ngày nhập"></v-text-field>
      <p>Dữ liệu nhập hàng :</p>
      <v-btn  style="float:right;margin-bottom: 50px;background-color:#7bd0f7" @click="addMoreProduct">Thêm</v-btn>
      <v-container>

        <table class="table table-bordered">
          <thead>
          <tr
          >
            <th scope="col">STT</th>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Nhà cung cấp</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Đơn giá</th>
            <th scope="col">Ngày sản xuất</th>
            <th scope="col">Ngày hết hạn</th>
            <th scope="col">Tổng tiền</th>
            <th scope="col">Thao tác</th>
          </tr>
          </thead>
          <tbody>
          <tr
            v-for="n in totalProducts"
            :key="n"
            >
            <th scope="row">{{n}}</th>
            <td>
              <select class="form-control" name="cate" v-model="cate">
                <option v-for="item in items" v-bind:key="item.id" v-bind:value="item">
                  {{ item.category_name }}
                </option>
              </select>
            </td>
            <td>
              <select class="form-control" name="cate" v-model="cate">
                <option v-for="item in items" v-bind:key="item.id" v-bind:value="item">
                  {{ item.category_name }}
                </option>
              </select>
            </td>
            <td>@mdo</td>
            <td>Mark</td>
            <td><input type="date" id="NXS" name="NXS"></td>
            <td><input type="date" id="HSD" name="HSD"></td>
            <td>@mdo</td>
            <td>
              <v-btn
              @click="removeElement(n)"
              >Delete</v-btn>
            </td>
          </tr>

          </tbody>
        </table>
      </v-container>
      <div style="float:right">
        <v-btn
          color="blue"
          elevation="2"
          @click="addCate"
        >Submit</v-btn>
        <v-btn

          color="blue"
          elevation="2"
          @click="backToList"
        >Cancel</v-btn>
      </div>


    </CCardBody>
  </CCard>
</template>

<script>
import moment from "moment";

export default {
  name: 'Table',
  data: () => ({
    items: ['Foo', 'Bar', 'Fizz', 'Buzz'],
    totalProducts:"1",
    cateId:"",
    cateName:"",
    createDate:moment().format('YYYY-MM-DD'),
    updateDate:moment().format('YYYY-MM-DD'),
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  methods:{
    backToList(){
      this.$router.push({path:'/base/ReceiptList'});
    },
    addMoreProduct(){
      this.totalProducts ++;
    },
    removeElement: function (index) {
      document.getElementsByTagName("tr")[index].remove()
    },
    addCate(){
      this.$axios.post('http://localhost:3001/products',{
        id : this.id,
        category_name : this.cateName,
        create_date : this.createDate,
        create_update : this.updateDate
      }).then(resp =>{
        console.log(resp)
        alert("Thêm mới loại hàng thành công!");
      })
        .catch((err) => {
          console.log(err)
        });
    }
  }
}
</script>
<style>
.slt{
  margin-left: -400px;
}
.btn{
  color: blue;
}
</style>
