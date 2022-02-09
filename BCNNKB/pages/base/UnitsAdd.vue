<template>
  <CCard>
    <CCardHeader>
      <slot name="header">
        <CIcon name="cil-justify-center"/><strong>Unit Add </strong>
      </slot>
    </CCardHeader>
    <CCardBody>
      <v-text-field
        label="Unit Id"
        :rules="rules"
        v-model="unitId"
        hide-details="auto"
      ></v-text-field>
      <v-text-field :rules="rules" v-model="unitName" label="Unit name"></v-text-field>
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
    unitId:"",
    unitName:"",
    rules: [
      value => !!value || '*',
      value => (value && value.length >= 3) || 'Min 3 characters',
    ],
  }),
  methods:{
    backToList(){
      this.$router.push({path:'/base/UnitList'});
    },
    addCate(){
      this.$axios.post('http://localhost:3001/units',{
        unit_id : this.unitId,
        unit_name : this.unitName,
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
