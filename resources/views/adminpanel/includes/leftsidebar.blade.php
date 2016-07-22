 
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">

      <li class="{{ Request::is(LaravelLocalization::setLocale().'/cms') ? 'active' : '' }}" ><a href="/cms/"><i class="fa fa-tachometer"></i> <span>Dashboard</span></a></li>

    @can('user.edit')
      <li class="treeview">
        <a href="#"><i class="fa fa-users"></i> <span>Users settings</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">

      <li class="{{ Request::is(LaravelLocalization::setLocale().'/cms/users') ? 'active' : '' }}" ><a href="/cms/users"><i class="fa fa-user"></i> <span>Users</span></a></li>
      <li class="{{ Request::is(LaravelLocalization::setLocale().'/cms/roles') ? 'active' : '' }}" ><a href="/cms/roles"><i class="fa fa-unlock-alt"></i> <span>Roles</span></a></li>
      <li class="{{ Request::is(LaravelLocalization::setLocale().'/cms/permissions') ? 'active' : '' }}" ><a href="/cms/permissions"><i class="fa fa-lock"></i> <span>Permissions</span></a></li>
       
        </ul>
      </li>
    @endcan  

      <li class="{{ Request::is(LaravelLocalization::setLocale().'/cms/translations') ? 'active' : '' }}" ><a href="/cms/translations"><i class="fa fa-language"></i> <span>Translations</span></a></li>  



      <li class="treeview">
        <a href="#"><i class="fa fa-cogs"></i> <span>Settings</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="#">Email settings</a></li>
          <li><a href="#">Site settings</a></li>
        </ul>
      </li>
    </ul>
    <!-- /.sidebar-menu -->
  </section>
  <!-- /.sidebar -->
</aside>
