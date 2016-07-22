
  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="/cms" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>N</b>ET</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>NET</b>.az</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a>
              <span class="hidden-xs"></span>
            </a>
          </li>

            
          <li class="dropdown">
            <a  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Language<span class="caret"></span></a>
            <ul class="dropdown-menu">

            @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
                  <li>
                      <a rel="alternate"  hreflang="{{$localeCode}}" href="{{LaravelLocalization::getLocalizedURL($localeCode) }}">
                          {{{ $properties['native'] }}}
                      </a>
                  </li>
              @endforeach
            </ul>
          </li>
  
          <li>
            <a href="/cms/logout"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
