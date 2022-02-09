<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Products Add </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Category Id"
        :rules="rules"
        v-model="id"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="productName" label="Category name"></v-text-field>
      <p>Category:</p>
      <select class="form-control" name="cate" v-model="cate">
        <option v-for="item in items" v-bind:key="item.id" v-bind:value="item">
          {{ item.category_name }}
        </option>
      </select>
      <br/>
      <v-text-field :rules="rules" v-model="creater" label="Creater"></v-text-field>
      <v-text-field :rules="rules" v-model="priceImport" label="Import price"></v-text-field>
      <v-text-field :rules="rules" v-model="retailPrice" label="Retail price"></v-text-field>
      <v-text-field :rules="rules" v-model="sellingPrice" label="Selling price"></v-text-field>
      <p>Unit:</p>
      <select class="form-control" name="unit" v-model="unit">
        <option v-for="item in units" v-bind:key="item.unit_id" v-bind:value="item">
          {{ item.unit_name }}
        </option>
      </select>
      <v-text-field :rules="rules" v-model="quantity" label="Quantity"></v-text-field>
      <p> Status: </p>
      <v-radio-group
        v-model="state"
        state
      >
        <v-radio
          label="Active"
          value="1"
        ></v-radio>
        <v-radio
          label="Non-Active"
          value="0"
        ></v-radio>
      </v-radio-group>

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

export default {
  name: 'Table',
  data: () => ({
    id:"",
    productName:"",
    creater:"",
    priceImport:"",
    retailPrice:"",
    sellingPrice:"",
    cate:"",
    unit:"",
    quantity:"",
    state:"",
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
    items: [],
    units:[],
  }),
  mounted() {
    this.getListCate();
    this.getListUnit();
  },
  methods:{
    backToList(){
      this.$router.push({path:'/base/ProductsList'});
    },
    getListCate(){
      this.$axios
        .get('http://localhost:3001/products')
        .then((response) =>{
          this.items = response.data

        });
    },
    getListUnit(){
      this.$axios
        .get('http://localhost:3001/units')
        .then((response) =>{
          this.units = response.data

        });
    },
    addCate(){
      this.$axios.post('http://localhost:3001/product',{
        product_id : this.id,
        name : this.productName,
        creater: this.creater,
        price_import : this.priceImport,
        retail_price : this.retailPrice,
        selling_price : this.sellingPrice,
        category_id :this.cate.id,
        unit_id : this.unit.unit_id,
        quantily : this.quantity,
        state : this.state,
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
