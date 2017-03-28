<?php
  include_once('inc/connect_notebook.php');
  include_once('inc/connect_phone.php');
?>
<div class="container" id="content">
	<div class="row">
    <table id="cart" class="table table-hover table-condensed">
          <thead>
          <tr>
            <th style="width:50%"><?php echo translate_get($_SESSION['lang'],"product");?></th>
            <th style="width:10%"><?php echo translate_get($_SESSION['lang'],"price");?></th>
            <th style="width:8%"><?php echo translate_get($_SESSION['lang'],"quantity");?></th>
            <th style="width:22%" class="text-center"><?php echo translate_get($_SESSION['lang'],"subtotal");?></th>
            <th style="width:10%"></th>
          </tr>
        </thead>
        <tbody>

            <?php
              $calc = new Notebook('clopotel_md');
              $items = $calc->getCart($_SESSION['user_id']);
              $k=1;
              $total=0;
              if($items)
              foreach($items as $item){
                $total+=$item['Price']*$item['Count'];
          echo '<tr>
                  <td data-th="Product">
                    <div class="row">
                      <div class="col-sm-2 hidden-xs"><img src="'.$item['Cover'].'" alt="..." class="img-responsive"/></div>
                      <div class="col-sm-10">
                        <h4 class="nomargin">'.$item['FullName'].'</h4>
                        <p>'.$item['FullName'].'</p>
                      </div>
                    </div>
                  </td>
                  <td data-th="Price">'.$item['Price'].' lei</td>
                  <td data-th="Quantity">
                    <input id="1_'.$item['ID'].'" type="number" class="form-control text-center" value="'.$item['Count'].'">
                  </td>
                  <td data-th="Subtotal" class="text-center">'.$item['Price']*$item['Count'].' lei</td>
                  <td class="actions" data-th="">
                    <button onclick="refreshCart(\'1\',\''.$item['ID'].'\',\''.$_SESSION['user_id'].'\',\''.$_SESSION['lang'].'\')" class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                    <button onclick="deleteFromCart(\'1\',\''.$item['ID'].'\',\''.$_SESSION['user_id'].'\')" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                  </td>
                </tr>';
                $k++;
              }
              $ph = new Phone('clopotel_md');
              $items = $ph->getCart($_SESSION['user_id']);
              if($items)
              foreach($items as $item){
                $total+=$item['Price']*$item['Count'];
          echo '<tr>
                  <td data-th="Product">
                    <div class="row">
                      <div class="col-sm-2 hidden-xs"><img src="'.$item['Cover'].'" alt="..." class="img-responsive"/></div>
                      <div class="col-sm-10">
                        <h4 class="nomargin">'.$item['FullName'].'</h4>
                        <p>'.$item['FullName'].'</p>
                      </div>
                    </div>
                  </td>
                  <td data-th="Price">'.$item['Price'].' lei</td>
                  <td data-th="Quantity">
                    <input id="2_'.$item['ID'].'" type="number" class="form-control text-center" value="'.$item['Count'].'">
                  </td>
                  <td data-th="Subtotal" class="text-center">'.$item['Price']*$item['Count'].' lei</td>
                  <td class="actions" data-th="">
                    <button onclick="refreshCart(\'2\',\''.$item['ID'].'\',\''.$_SESSION['user_id'].'\',\''.$_SESSION['lang'].'\')"class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                    <button onclick="deleteFromCart(\'2\',\''.$item['ID'].'\',\''.$_SESSION['user_id'].'\')" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                  </td>
                </tr>';
                $k++;
              }
            ?>


            <!--
            <tr>
              <td data-th="Product">
                <div class="row">
                  <div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
                  <div class="col-sm-10">
                    <h4 class="nomargin">Product 1</h4>
                    <p>Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet.</p>
                  </div>
                </div>
              </td>
              <td data-th="Price">$1.99</td>
              <td data-th="Quantity">
                <input type="number" class="form-control text-center" value="1">
              </td>
              <td data-th="Subtotal" class="text-center">1.99</td>
              <td class="actions" data-th="">
                <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
              </td>
            </tr>
            !-->

        </tbody>
        <tfoot>
          <tr class="visible-xs">
            <td class="text-center"><strong><?php echo translate_get($_SESSION['lang'],"total");?> </strong></td>
          </tr>
          <tr>
            <td><a href="index.php" class="btn btn-warning"><i class="fa fa-angle-left"></i> <?php echo translate_get($_SESSION['lang'],"continue_shopping");?></a></td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong><?php echo translate_get($_SESSION['lang'],"total"); echo ': '.$total.' lei';?></strong></td>
            <td><a href="#" class="btn btn-success btn-block"><?php echo translate_get($_SESSION['lang'],"checkout");?> <i class="fa fa-angle-right"></i></a></td>
          </tr>
          <p id="result"></p>
        </tfoot>
      </table>
	</div>
</div>
