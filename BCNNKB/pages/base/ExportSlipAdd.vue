<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Tạo mới phiếu xuất </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      {{product.name}}
      <v-text-field
        label="Mã phiếu xuất"
        :rules="rules"
        v-model="order_id"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="content" label="Nội dung xuất hàng"></v-text-field>
      <v-text-field :rules="rules" v-model="creater" label="Người tạo"></v-text-field>
      <v-textarea
        solo
        name="input-7-4"
        v-model="description"
        label="Ghi chú"
      ></v-textarea>
      <v-text-field :rules="rules" v-model="createDate" label="Ngày xuất"></v-text-field>
      <p>Dữ liệu xuất hàng :</p>
      <v-btn  style="float:right;margin-bottom: 50px;background-color:#7bd0f7" :disabled="isActive" @click="addMoreProduct">Thêm</v-btn>
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
              <select class="form-control" name="product" v-model="product[n]">
                <option v-for="item in products" v-bind:key="item.product_id" v-bind:value="item">
                  {{ item.name }}
                </option>
              </select>
            </td>
            <td>
              <select class="form-control" name="cate" v-model="supplier[n]">
                <option v-for="item in suppliers" v-bind:key="item.supplier_id" v-bind:value="item">
                  {{ item.supplier_name }}
                </option>
              </select>
            </td>
            <td><input type="text"  name="NXS" v-model="quantity[n]"></td>
            <td><input type="text"  name="NXS" v-model="price[n]"></td>
            <td><input type="date"  name="NXS" v-model="production_date[n]"></td>
            <td><input type="date"  name="HSD" v-model="expiration_date[n]"></td>
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
          @click="addReciept_"
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
    isActive:false,
    products: [],
    product:[],
    suppliers: [],
    supplier:[],
    quantity:[],
    price :[],
    production_date:[],
    expiration_date:[],
    totalProducts:1,
    order_id:"",
    content:"",
    creater:"",
    description :"",
    create_date :"",
    createDate:moment().format('YYYY-MM-DD'),
    updateDate:moment().format('YYYY-MM-DD'),
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  created() {
    this.getListProduct();
    this.getListSupplier();
    this.getListUnit();

  },
  methods:{
    checkAddbtnn(){
      if(!this.production_date=="") {
        this.isActive = false
      }else {
        this.isActive = true
      }
    },
    backToList(){
      this.$router.push({path:'/base/ExportSlipList'});
    },
    getListProduct(){
      this.$axios
        .get('http://localhost:3001/product')
        .then((response) =>{
          this.products = response.data
          console.log(response.data)
        });

    },
    getListUnit(){
      this.$axios
        .get('http://localhost:3001/units')
        .then((response) =>{
          this.units = response.data

        });
    },
    getListSupplier(){
      this.$axios
        .get('http://localhost:3001/supplier')
        .then((response) =>{
          this.suppliers = response.data
          console.log(response.data)
        });

    },
    validate(){
      if(this.order_id && this.order_id !== ""){
        return true;
      }else {
        return false;
      }
    },

    addMoreProduct(){
      if(this.validate()) {
        this.totalProducts++;
      }else {
        alert("mã phiếu nhập không được bỏ trống")
      }
    },
    removeElement: function (index) {
      document.getElementsByTagName("tr")[index].remove()
    },
    addReciept_(){
      this.$axios.post('http://localhost:3001/export',{
        id : this.order_id,
        content : this.content,
        creater : this.creater,
        description : this.description,
        create_date : this.createDate,
      })
        .catch((err) => {
          console.log(err)
        });
      for (let i = 1; i <= this.totalProducts; i++) {
        this.$axios.post('http://localhost:3001/export/detail', {
          product_name: this.product[i].name,
          suppplier: this.supplier[i].supplier_name,
          price: this.price[i],
          production_date: this.production_date[i],
          expiration_date: this.expiration_date[i],
          total_price: this.price[i] * this.quantity[i],
          export_id: this.order_id,
          quantity: this.quantity[i],
        }).then((response) => {
            if (response.data) {
              console.log("Thêm mới thành công!")
            }
          }
        )
          .catch((err) => {
            console.log(err)
            console.log("Đã xảy ra lỗi")
          });

      }
      alert("Thêm mới thành công!")

    },

  },
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
