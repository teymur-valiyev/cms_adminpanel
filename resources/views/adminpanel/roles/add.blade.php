@extends('adminpanel.panel')

@section('body')

<link rel="stylesheet" href="{{ asset("adminassets/plugins/select2/select2.min.css") }}">

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Roles
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="/{{ LaravelLocalization::setLocale() }}/cms/roles"></i> Roles</a></li>
        <li class="active">Create</li>
      </ol>
    </section>
  <!-- Main content -->
  <section class="content">
    <div class="row">

      <div class="col-md-1"></div>
      <!-- right column -->
      <div class="col-md-10">
        <!-- Horizontal Form -->
        <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Add Role</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
          <form class="form-horizontal" method="Post" action="{{ url(LaravelLocalization::setLocale().'/cms/roles/')}}">
            <div class="box-body">

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="flash-message">
               @if(Session::has('alert-success'))
                <p class="alert alert-success">{{ Session::get('alert-success') }} 
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                </p>
              @endif
            </div>
            
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">name</label>

                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputName" placeholder="name" name="name" value="{{ old('name') }}" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputDescription" class="col-sm-2 control-label">description</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputDescription" placeholder="description" name="description" value="{{ old('description') }}">
                </div>
              </div>

              <div class="form-group">

                <label for="inputpermissions" class="col-sm-2 control-label">Permission</label>

                <div class="col-sm-10">

                  <select name="permissions[]" class="form-control select2" id="inputpermissions" multiple="multiple" data-placeholder="select permission">
                  @foreach($permissions as $permission)
                    <option  value="{{ $permission->id }}">{{$permission->name}}</option>
                  @endforeach
                  </select>
                </div>
              </div>

            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                            
              <input type="hidden" name="_token" value="{{ csrf_token() }}">

              <a href="/cms/roles" class="btn btn-default">Cancel</a>

              <button type="submit" class="btn btn-info pull-right">Save</button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
        <!-- /.box -->

      </div>
      <!--/.col (right) -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>

<script src="{{ asset("adminassets/plugins/select2/select2.full.min.js") }}"></script>

<script type="text/javascript">
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
  });
</script>


@stop