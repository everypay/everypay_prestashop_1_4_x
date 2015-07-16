<div class="everypay_container">

    <div class="admin_logo">
        <p>{$trans['Accept payments with VISA/Mastercard safely, through EveryPay']}</p>    
    </div>


    <div class="menu_admin">
        <ul>
            <li class="text_li_label">{$trans['Are you NEW to EveryPay? You should']}</li>
            <li><a class="button btn-blue" href="http://everypay.gr">{$trans['Sign Up']}</a></li>
        </ul>
    </div>

    {$adminMessages.warnings}
    {$adminMessages.errors}
    {$adminMessages.success}

    <div class="ev_settings">
        <form method="post" action="">
            <fieldset>
                <legend><img alt="" src="/modules/{$EVERYPAY_MODULE_NAME}/logo.png" style="width:16px;height:16px;"> {$trans['EveryPay account settings']}</legend>

                <div class="mode_switch"><label>{$trans['Choose Mode']}:</label>
                    <input type="radio" id="test_mode" name="mode" value="0" {if !$EVERYPAY_LIVE_MODE}checked{/if}><label for="test_mode">Test</label> 
                    <input type="radio" id="live_mode" name="mode" value="1" {if $EVERYPAY_LIVE_MODE}checked{/if}><label for="live_mode">LIVE</label>
                </div>

                <br />
                <div class="half-fieldset">
                    <br /><br />
                    <h3>{l s='Live Account'}</h3>
                    <br />
                    <label for="input_public_key">{$trans['Public Key']}:</label>
                    <div class="margin-form">
                        <input class="monospace" type="text" value="{$EVERYPAY_CONFIGURATION.EVERYPAY_PUBLIC_KEY}" id="input_public_key" name="input_public_key" />
                    </div>

                    <label for="input_secret_key">{$trans['Secret Key']}:</label>
                    <div class="margin-form">
                        <input class="monospace" type="text" value="{$EVERYPAY_CONFIGURATION.EVERYPAY_SECRET_KEY}" id="input_secret_key" name="input_secret_key" />                 
                    </div>

                    <label>&nbsp;</label>
                    <div class="margin-form"><a href="http://everypay.local/support" target="_blank">{$trans['Where can I find these?']}</a></div>
                </div>


                <div class="half-fieldset">
                    <br /><br />
                    <h3>{l s='Test Account'}</h3>
                    <br />
                    <label for="input_public_key">{$trans['Public Key']}:</label>
                    <div class="margin-form">
                        <input class="monospace" type="text" value="{$EVERYPAY_CONFIGURATION.EVERYPAY_TEST_PUBLIC_KEY}" id="input_test_public_key" name="input_test_public_key" />
                    </div>

                    <label for="input_secret_key">{$trans['Secret Key']}:</label>
                    <div class="margin-form">
                        <input class="monospace" type="text" value="{$EVERYPAY_CONFIGURATION.EVERYPAY_TEST_SECRET_KEY}" id="input_test_secret_key" name="input_test_secret_key" />
                    </div>                

                    <label>&nbsp;</label>
                    <div class="margin-form"><a href="http://everypay.local/support" target="_blank">{$trans['Where can I find these?']}</a></div>
                </div>


                <p class="center"><input type="submit" value="{$trans['Save Settings']}" name="submitConfiguration" class="button"></p>
            </fieldset>

            <br />

            <fieldset>
                <legend><img alt="" src="..../../../img/admin/edit.gif" style="width:16px;height:16px;"> {$trans['Other Settings']}</legend>

                <label for="input_customer_mode">{$trans['Enable customers to save cards']}</label>
                <div class="margin-form">
                    <input type="checkbox" value="1" id="input_customer_mode" name="input_customer_mode" {if $EVERYPAY_CUSTOMER_MODE}checked="checked"{/if} autocomplete=off />
                    &nbsp;&nbsp;&nbsp;<a href="https://www.everypay.gr/docs" target="_blank">{$trans['What\'s this?']}</a>
                </div>
                <br />
                {*
                <label for="input_button_mode">{$trans['Enable quick button']}</label>
                <div class="margin-form">
                    <input type="checkbox" value="1" id="input_button_mode" name="input_button_mode" {if $EVERYPAY_BUTTON_MODE}checked="checked"{/if} autocomplete=off />
                    &nbsp;&nbsp;&nbsp;<a href="https://everypay.gr/docs/button" target="_blank">{$trans['What\'s this?']}</a>
                </div>
                <br/>*}
                <p class="center"><input type="submit" value="{$trans['Save Settings']}" name="submitConfiguration" class="button"></p>
            </fieldset>
        </form>
    </div>
</div>

{literal}
    <script type="text/javascript">
        //just to reset the radio button
        $(document).ready(function() {
            $('.mode_switch [checked]').trigger('click');
        });
    </script>        
{/literal}