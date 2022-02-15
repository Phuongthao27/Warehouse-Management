export default [
  {
    _name: 'CSidebarNav',
    _children: [
      {
        _name: 'CSidebarNavItem',
        name: 'Dashboard',
        to: '/dashboard',
        icon: 'cil-speedometer',
        badge: {
          color: 'primary',
          text: 'NEW'
        }
      },
      {
        _name: 'CSidebarNavTitle',
        _children: ['Thống kê']
      },
      {
        _name: 'CSidebarNavItem',
        name: 'Thống kê xuất nhập kho',
        to: '/theme/colors',
        icon: 'cil-drop'
      },
      {
        _name: 'CSidebarNavItem',
        name: 'Thống kê doanh thu',
        to: '/theme/typography',
        icon: 'cil-pencil',
      },
      {
        _name: 'CSidebarNavTitle',
        _children: ['THIẾT LẬP DỮ LIỆU']
      },
      {
        _name: 'CSidebarNavDropdown',
        name: 'Dữ liệu sản phẩm',
        to: '/theme/ProductionList',
        icon: 'cil-drop',
        items: [
          {
            name: 'Loại hàng',
            to: '/base/CategoryList'
          },
          {
            name: 'Đơn vị tính',
            to: '/base/UnitList'
          },
          {
            name: 'Sản phẩm',
            to: '/base/ProductsList'
          }
        ]
      },
      {
        _name: 'CSidebarNavItem',
        name: 'Nhà cung cấp',
        to: '/base/SupplierList',
        icon: 'cil-pencil'
      },

      {
        _name: 'CSidebarNavTitle',
        _children: ['DỮ LIỆU NHẬP XUẤT']
      },
      {
        _name: 'CSidebarNavDropdown',
        name: 'Dữ liệu nhập hàng',
        route: '/base',
        icon: 'cil-puzzle',
        items: [
          {
            name: 'Nhập hàng',
            to: '/base/ReceiptList'
          },
          {
            name: 'Sản phẩm đã nhập',
            to: '/base/ProductImportList'
          },

        ]
      },
      {
        _name: 'CSidebarNavDropdown',
        name: 'Dữ liệu xuất hàng',
        route: '/base',
        icon: 'cil-bell',
        items: [
          {
            name: 'Xuất Hàng',
            to: '/base/ExportSlipList'
          },
          {
            name: 'Sản phẩm đã xuất',
            to: '/base/ProductExportList'
          },
        ]
      },
      {
        _name: 'CSidebarNavDivider',
        _class: 'm-2'
      },
      {
        _name: 'CSidebarNavTitle',
        _children: ['THÔNG TIN QUẢN TRỊ']
      },
      {
        _name: 'CSidebarNavItem',
        name: 'Đổi mật khẩu',
        to: '/theme/colors',
        icon: 'cil-drop'
      },
      {
        _name: 'CSidebarNavItem',
        name: 'Quản trị viên',
        to: '/base/Login',
        icon: 'cil-pencil'
      },

    ]
  }
]
