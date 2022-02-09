<template>
  <CRow>
    <CCol col>
      <CCard>
        <CCardHeader>
          <v-card-title>
            <CIcon name="cil-justify-center"/><strong>Supplier list</strong>
            <v-spacer></v-spacer>
            <v-text-field

              label="Search"
              single-line
              hide-details
              v-model="search"
            ></v-text-field>
          </v-card-title>

          <v-btn
            style="margin-left: 12px"
            color="blue"
            elevation="2"
            @click="supplierAdd"
          >Add Supplier</v-btn>
          <v-spacer></v-spacer>
          <div style="padding-top:30px"></div>

          <div class="card-header-actions">
            <a
              href="https://coreui.io/vue/docs/components/breadcrumb"
              class="card-header-action"
              rel="noreferrer noopener"
              target="_blank"
            >
              <small class="text-muted">docs</small>
            </a>
          </div>
        </CCardHeader>
        <CCardBody>
          <v-data-table
            :headers="headers"
            :items="items"
            :search="search"
          >



            <template v-slot:item.action="{ item }">
              <!--              <v-icon small class="mr-2" @click="updateCate(item.id)">edit</v-icon>-->
              <a href="javascript:;" v-on:click=" update(item.supplier_id)">Edit </a>
              <!--              <v-icon small @click="deleteCate(item.id)">delete</v-icon>-->
              <a href="javascript:;" v-on:click=" deleteSup(item.supplier_id)">Delete</a>
            </template>


            <v-alert slot="no-results" :value="true" color="error" icon="warning">
              Your search for "{{ search }}" found no results.
            </v-alert>
          </v-data-table>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>
// import search from '../../components/search'

export default {
  name: 'Breadcrumbs',
  components: {},
  data () {
    return {
      headers: [
        { text: 'ID', value: 'supplier_id' },
        { text: 'Supplier name', value: 'supplier_name' },
        { text: 'Action', value: 'action', sortable: false }
      ],
      items: [],
      dialog: false,
      search:"",
    }
  },
  created() {
    this.getList()


  },
  methods:  {
    supplierAdd(){
      this.$router.push({path:'/base/SupplierAdd'});
    },
    getList () {
      this.$axios
        .get('http://localhost:3001/supplier')
        .then((response) =>{
          this.items = response.data
        });
    },
    async deleteSup(Id){
      console.log(Id)
      if(confirm("Do you really want to delete?")){

        await this.$axios.delete('http://localhost:3001/supplier/'+Id)
          .catch(error => {
            console.log(error);
          })
        this.getList()
        await console.log("done")
      }

    },
    async  update(Id){
      this.$router.push({path:'/base/SupplierUpdate', query: {id: Id}});
      console.log(Id)


    }

  }



}
</script>
<style>
.breadcrumb-item + .font-xl.breadcrumb-item::before {
  color: rgb(140, 195, 38);
  content: '>>';
  padding: 0px 10px;

}

.icon{
  border: 1px solid red;
  border-bottom-right-radius: 25px;
}
</style>
