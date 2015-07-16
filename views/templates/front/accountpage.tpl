{capture name=path}
    <a href="{$link->getPageLink('my-account', true)|escape:'htmlall':'UTF-8'}">
        {l s='My account' mod='everypay_prestashop_1_4_x'}</a>
    <span class="navigation-pipe">{$navigationPipe}</span>{l s='My credit/debit cards' mod='everypay_prestashop_1_4_x'}
{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

<div id="everypay_confirmation_wrapper" class="everypay_customer_cards_container">
    <h1>{l s='My credit/debit cards' mod='everypay_prestashop_1_4_x'}</h1>
    {if $EVERYPAY_CARDS}
        {if isset($EVERYPAY_MSG) && $EVERYPAY_MSG}
            <p class="warning">{$EVERYPAY_MSG}</p>
        {/if}
        <p> {l s='Here you can review your stored Credit/Debit cards.' mod='everypay_prestashop_1_4_x'}
            <br /><br />
            {l s='Note that your sensitive card data are not really stored in our store. Instead a unique token is created so that your future transactions use this.' mod='everypay_prestashop_1_4_x'}
        </p>
        <table class="std" id="order-list">
            <thead>
                <tr>
                    <th></th>
                    <th>{l s='Card' mod='everypay_prestashop_1_4_x'}</th>
                    <th>{l s='Expiration' mod='everypay_prestashop_1_4_x'}</th>
                    <th></th>
                </tr>

            </thead>
            <tbody>
                {foreach from=$EVERYPAY_CARDS item=card}
                    <tr>
                        <td style="text-align:center"><img src="/modules/{$EVERYPAY_MODULE_NAME}/assets/images/icon-{$card['card_type']|strtolower}.gif" /></td>
                        <td style='font-family: Monospace'>{$card['card_type']|str_pad:14:".":$smarty.const.STR_PAD_RIGHT}{$card['card_last_four']}</td>
                        <td>{$card['exp_month']|str_pad:2:"0":$smarty.const.STR_PAD_LEFT}/{$card['exp_year']}</td>
                        <td>
                            <form action="{$EVERYPAY_FORM_ACTION}" method="POST">
                                <input type="submit" name="deleteCard" class="exclusive button" value="{l s='Remove' mod='everypay_prestashop_1_4_x'}">
                                <input type="hidden" name="card" value="{$card['id_customer_token']}" />
                            </form>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    {else}   

        {if isset($EVERYPAY_MSG) && $EVERYPAY_MSG}
            <p class="warning">
                <font style="font-size:15px; font-weight:bold;">{$EVERYPAY_MSG}</font>
            </p>
        {/if}

        <p class="warning">{l s='No stored cards have been found' mod='everypay_prestashop_1_4_x'}</p>

        <p>
            {l s='No credit/debit card has been stored in your account yet. You will be offered to save your card upon your first order that is paid with credit/debit card (check the "save card" option).' mod='everypay_prestashop_1_4_x'}                
            <br/><br/>
            {l s='Note that your sensitive card data are not really stored in our store. Instead a unique token is created so that your future transactions use this.' mod='everypay_prestashop_1_4_x'}
        </p>
    {/if}

    <div class="everypay_selection_wrapper_new_card on_the_right" style="display:none;">
        <form action="{$EVERYPAY_FORM_ACTION}" method="POST" id="everypay-payment-form" class="everypay_form add-everypay-card-form" >

            <p class="required text">
                <label for="card-number">{l s='Card Number' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" maxlength="16" autocomplete="off" id="card-number" data-card="card_number" placeholder="XXXX-XXXX-XXXX-XXXX" value="" class="text">
            </p>   

            <p class="select">
                <span>{l s='Expiration' mod='everypay_prestashop_1_4_x'} <sup>*</sup></span> 
                <select id="card-month" data-card="expiration_month">
                    <option value="0">{l s='Month' mod='everypay_prestashop_1_4_x'}</option>
                    {for $foo=1 to 12}
                        <option value="{$foo}">{$foo|str_pad:2:"0":$smarty.const.STR_PAD_LEFT}</option>
                    {/for}
                </select>
                <select id="card-year" data-card="expiration_year">
                    <option value="0">{l s='Year' mod='everypay_prestashop_1_4_x'}</option>
                    {for $foo=$smarty.now|date_format:'%Y' to ($smarty.now|date_format:'%Y')+8}
                        <option value="{$foo}">{$foo}</option>
                    {/for}
                </select>
            </p>

            <p class="required text">
                <label for="card-cvv">{l s='CVV' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" autocomplete="off" maxlength="3" id="card-cvv" data-card="cvv" placeholder="XXX" value="" class="text">
            </p>

            <p class="required text">
                <label for="card-name">{l s='Card Name' mod='everypay_prestashop_1_4_x'} <sup>*</sup></label>
                <input type="text" autocomplete="off" id="card-name" data-card="holder_name" placeholder="{l s='John Doe' mod='everypay_prestashop_1_4_x'}" value="" class="text">
            </p>

            <div class="submit-everypay">
                <div class="form-error" style="display:none"></div>
                {if ($EVERYPAY_CUSTOMER_MODE)}           
                    <p>
                        <label for="remember_ev_card">
                            <small>{l s='Your card details don\'t get really stored. A unique token gets saved instead and that will be used in your transactions.' mod='everypay_prestashop_1_4_x'}</small>
                        </label>
                    </p>
                {/if}
                <input type="submit" class="submit-payment exclusive button" value="{l s='Add card' mod='everypay_prestashop_1_4_x'}" />
            </div>
        </form>
        
        <script type="text/javascript">
            //<![CDATA[
            var $everypayForm = {};
            Everypay.setPublicKey('{$EVERYPAY_PUBLIC_KEY}');
            $(document).ready(function() {
                $everypayForm = $('#everypay-payment-form');
                $everypayForm.find('button, input, select').attr('disabled', false);
                bindEveryPayForm();

                $('#show_add_card_form').unbind('click').bind('click', function() {
                    $('.everypay_selection_wrapper_new_card').show(function() {
                        $('#show_add_card_form').remove();
                    });
                });
            });
            
            $('.everypay_customer_cards_container table input[type="submit"]').bind('click', function() {
                if (!confirm('Are you sure?'))
                    return false;
            });
            //]]>
        </script>
    </div>

    <ul class="footer_links">
        <li class="fleft">
            <a href="{$link->getPageLink('my-account.php', true)|escape:'htmlall':'UTF-8'}"><img src="{$img_dir}icon/my-account.gif" alt="" class="icon" />{l s='Back to Your Account' mod='everypay_prestashop_1_4_x'}</a>
        </li>
        <li class="fright" style="float:right;">
            <input type="button" class="exclusive button" id="show_add_card_form" style="float:right;" value="{l s='Add a card' mod='everypay_prestashop_1_4_x'}" />
        </li>
    </ul>
</div>