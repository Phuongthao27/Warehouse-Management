<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Category Add </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Category Id"
        :rules="rules"
        v-model="cateId"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="cateName" label="Category name"></v-text-field>
      <v-text-field :rules="rules" v-model="createDate" label="Create date"></v-text-field>
      <v-text-field :rules="rules" v-model="updateDate" label="Update date"></v-text-field>
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
