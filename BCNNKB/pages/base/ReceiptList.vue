<template>
  <v-app>

  <CRow>
    <CCol col>
      <CCard>
        <CCardHeader>
          <v-card-title>
            <CIcon name="cil-justify-center"/><strong> Phiếu nhập</strong>
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
            @click="categoryAdd"
          >Tạo mới phiếu nhập</v-btn>
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
            <template v-slot:item.create_date="{ item }">
              <span>{{new Date(item.create_date).toLocaleDateString()}}</span>
            </template>
            <template v-slot:item.create_update="{ item }">
              <span>{{new Date(item.create_update).toLocaleDateString()}}</span>

            </template>

            <template v-slot:item.action="{ item }">

              <!-- Show dialog Detail reciep -->
              <v-dialog
                transition="dialog-top-transition"
                max-width="1200"
                scrollable
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    v-bind="attrs"
                    v-on="on"
                  > Detail</v-btn>
                </template>
                <template v-slot:default="dialog">
                  <v-card>
                    <v-toolbar
                      color="primary"
                      dark
                    ><h3>Chi tiết phiếu nhập</h3></v-toolbar>
                    <v-card-text>
                      <div class="text pa-12" >
                        <h3 style="text-align: center">Chi tiết phiếu nhập hàng ...</h3>
                        <p>Mã đơn hàng</p>
                        <p>Người nhập</p>
                        <p>Nội dung nhập hàng</p>
                        <p>Ghi chú</p>
                        <p>Ngày tạo</p>
                        <p>Tổng giá trị nhập hàng</p>

                        <v-data-table
                          :headers="headers"
                          :items="items"
                          :search="search"
                        ></v-data-table>

                      </div>
                    </v-card-text>
                    <v-card-actions class="justify-end">
                      <v-btn
                        color="primary"
                        text
                        @click="dialog.value = false"
                      >Close</v-btn>
                    </v-card-actions>
                  </v-card>
                </template>
              </v-dialog>
              <!-- End dialog -->

              <!--<v-icon small class="mr-2" @click="updateCate(item.id)">edit</v-icon>-->
              <v-btn><a href="javascript:;" v-on:click=" updateCate(item.id)">Edit </a></v-btn>
              <!--              <v-icon small @click="deleteCate(item.id)">delete</v-icon>-->
              <v-btn> <a href="javascript:;" v-on:click=" deleteCate(item.id)">Delete</a></v-btn>

            </template>


            <v-alert slot="no-results" :value="true" color="error" icon="warning">
              Your search for "{{ search }}" found no results.
            </v-alert>
          </v-data-table>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
  </v-app>
</template>

<script>
// import search from '../../components/search'

export default {
  name: 'Breadcrumbs',
  components: {},
  data () {
    return {
      headers: [
        { text: 'ID', value: 'id' },
        { text: 'Category name', value: 'category_name' },
        { text: 'Create date', value: 'create_date' },
        { text: 'Update date', value: 'create_update' },
        { text: 'Action', value: 'action', sortable: false }
      ],
      items: [],
      dialog: false,
      search:"",
      showModalError:false,

    }
  },
  created() {
    this.getListCate()
    this.$axios
      .get('http://localhost:3001/products',)
      .then((response) =>{
        this.items = response.data
        console.log(response.data)

      });

  },
  methods:  {
    categoryAdd(){
      this.$router.push({path:'/base/RecieptAdd'});
    },
    getListCate () {
      this.$axios
        .get('http://localhost:3001/products',)
        .then((response) =>{
          this.items = response.data
        });
    },
    async deleteCate(cateId){
      console.log(cateId)
      if(confirm("Do you really want to delete?")){

        await this.$axios.delete('http://localhost:3001/products/'+cateId)
          .catch(error => {
            console.log(error);
          })
        this.getListCate()
        await console.log("done")
      }

    },
    async  updateCate(cateId){
      this.$router.push({path:'/base/CategoryUpdate', query: {id: cateId}});
      console.log(cateId)


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
