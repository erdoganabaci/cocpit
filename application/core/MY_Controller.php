<?php
class My_Controller extends CI_Controller
{
    public $user = false;
    public $client = false;
    public $core_settings = false;
    // Theme functionality
    protected $theme_view = 'application';
    protected $content_view = '';
    protected $view_data = array();
    
    public function __construct()
    {
        parent::__construct();

        /* XSS Filtering */
        if (!empty($_POST)) {
            $fieldList = array("description","message", "terms", "note", "invoice_terms", "estimate_terms", "bank_transfer_text", "smtp_pass", "password", "ticket_config_pass", "css-area");
            $ignoreXSS = array("mail_body");
            function remove_bad_tags_from($field)
            {
                $_POST[$field] = preg_replace('/(&lt;|<)\?php(.*)(\?(&gt;|>))/imx', '[php] $2 [php]', $_POST[$field]);
                $_POST[$field] = preg_replace('/((&lt;|<)(\s*|\/)script(.*?)(&gt;|>))/imx', ' [script] ', $_POST[$field]);
                $_POST[$field] = preg_replace('/((&lt;|<)(\s*)link(.*?)\/?(&gt;|>))/imx', '[link $4 ]', $_POST[$field]);
                $_POST[$field] = preg_replace('/((&lt;|<)(\s*)(\/*)(\s*)style(.*?)(&gt;|>))/imx', ' [style] ', $_POST[$field]);
                $_POST[$field] = preg_replace('/((&lt;|<)(\s*)(\/*)(\s*)input(.*?)(&gt;|>))/imx', ' [input] ', $_POST[$field]);
                $_POST[$field] = preg_replace('/((\s*)(\/*)(\s*)javascript:(.*?))/imx', ' [javascript] ', $_POST[$field]);
                $_POST[$field] = preg_replace('/((\s*)(\/*)(\s*)(alert|confirm|console.log)(\s*?\()(.*?))/imx', ' [blocked] ', $_POST[$field]);
                $_POST[$field] = preg_replace('/((\s *)(\/*)(\s*)(onclick|onfocus|ondblclick|onmouseover|onmousemove|onmouseenter)(\s*?)(\=))/imx', ' [blocked] ', $_POST[$field]);

            }

            foreach ($_POST as $key => $value) {
                if (in_array($key, $fieldList)) {
                    remove_bad_tags_from($key);
                } elseif (!in_array($key, $ignoreXSS)) {
                    $_POST[$key] = $this->security->xss_clean($_POST[$key]);
                }
            }
        }


        $this->view_data['core_settings'] = Setting::first();

        //Timezone
        if ($this->view_data['core_settings']->timezone != "") {
            date_default_timezone_set($this->view_data['core_settings']->timezone);
        }

        $this->view_data['datetime'] = date('Y-m-d H:i', time());
        $date = date('Y-m-d', time());

        //Languages
        if ($this->input->cookie('fc2language') != "") {
            $language = $this->input->cookie('fc2language');
        } else {
            if (isset($this->view_data['language'])) {
                $language = $this->view_data['language'];
            } else {
                if (!empty($this->view_data['core_settings']->language)) {
                    $language = $this->view_data['core_settings']->language;
                } else {
                    $language = "english";
                }
            }
        }
        $this->view_data['time24hours'] = "true";
        switch ($language) {

              case "english": $this->view_data['langshort'] = "en"; $this->view_data['timeformat'] = "h:i K"; $this->view_data['dateformat'] = "F j, Y"; $this->view_data['time24hours'] = "false"; break;
              case "dutch": $this->view_data['langshort'] = "nl"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d-m-Y"; break;
              case "french": $this->view_data['langshort'] = "fr"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d-m-Y"; break;
              case "german": $this->view_data['langshort'] = "de"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d.m.Y"; break;
              case "italian": $this->view_data['langshort'] = "it"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d/m/Y"; break;
              case "norwegian": $this->view_data['langshort'] = "no"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d.m.Y"; break;
              case "polish": $this->view_data['langshort'] = "pl"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d.m.Y"; break;
              case "portuguese": $this->view_data['langshort'] = "pt"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d/m/Y"; break;
              case "portuguese_pt": $this->view_data['langshort'] = "pt"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d/m/Y"; break;
              case "russian": $this->view_data['langshort'] = "ru"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d.m.Y"; break;
              case "spanish": $this->view_data['langshort'] = "es"; $this->view_data['timeformat'] = "H:i"; $this->view_data['dateformat'] = "d/m/Y"; break;
              default: $this->view_data['langshort'] = "en"; $this->view_data['timeformat'] = "h:i K"; $this->view_data['dateformat'] = "F j, Y"; $this->view_data['time24hours'] = "false"; break;

        }

        //fetch installed languages
        $installed_languages = array();
        if ($handle = opendir('application/language/')) {
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != ".." && $entry != ".DS_Store") {
                    array_push($installed_languages, $entry);
                }
            }
            closedir($handle);
        }

        $this->lang->load('application', $language);
        if (file_exists("./application/language/".$language."/custom_lang.php")) {
            $this->lang->load('custom', $language);
        }
        $this->lang->load('messages', $language);
        $this->lang->load('event', $language);
        $this->view_data['current_language'] = $language;
        $this->view_data['installed_languages'] = $installed_languages;


        //userdata
        $this->user = $this->session->userdata('user_id') ? User::find_by_id($this->session->userdata('user_id')) : false;
        $this->client = $this->session->userdata('client_id') ? Client::find_by_id($this->session->userdata('client_id')) : false;


        if ($this->user || $this->client) {

            //check if user or client
            if ($this->user) {
                $access            = explode(",", $this->user->access);
                $update            = $this->user;
                $email                = 'u'.$this->user->id;
                $userIsSuperAdmin    = ($this->user->admin == '1') ? true : false;
                $comp_array            = false;
                //Create client access list if active user is not super admin
                if (!$userIsSuperAdmin) {
                    $comp_array = array();
                    $thisUserHasCompanies = (array) $this->user->companies;
                    if (!empty($thisUserHasCompanies)) {
                        foreach ($this->user->companies as $value) {
                            array_push($comp_array, $value->id);
                        }
                        $comp_array = "'".implode(',', $comp_array)."'";
                    } else {
                        $comp_array = 0;
                    }
                }


                $this->view_data['menu'] = Module::find('all', array('order' => 'sort asc', 'conditions' => array('id in (?) AND type = ?', $access, 'main')));
                $this->view_data['module_permissions'] = array();
                $notification_list = array();
                foreach ($this->view_data['menu'] as $key => $value) {
                    array_push($this->view_data['module_permissions'], $value->link);
                }

                $this->view_data['widgets']        = Module::find('all', array('conditions' => array('id in (?) AND type = ?', $access, 'widget')));
                $this->view_data['user_online']    = User::all(array('conditions' => array('last_active+(30 * 60) > ? AND status = ?', time(), "active")));
                $this->view_data['client_online']    = Client::all(array('conditions' => array('last_active+(30 * 60) > ? AND inactive = ?', time(), "0")));
                $this->view_data['quotations_new']    = Quote::count(array('conditions' => array('status = ?', "New")));
                $this->view_data['quotations_new']    = $this->view_data['quotations_new']+Quoterequest::count(array('conditions' => array('status = ?', "New")));

                $this->view_data['sticky']            = Project::find_by_sql("select distinct(projects.name), projects.id, projects.tracking, projects.progress from projects, project_has_workers where projects.sticky = 1 AND projects.id = project_has_workers.project_id AND project_has_workers.user_id=".$this->user->id);

                $this->view_data['tickets_access'] = false;
                if (in_array("tickets", $this->view_data['module_permissions'])) {
                    $this->view_data['tickets_access'] = true;
                    $this->view_data['tickets_new'] = Ticket::newTicketCount($this->user->id, $comp_array);
                }


                if (in_array("invoices", $this->view_data['module_permissions'])) {
                    $overdueInvoices = Invoice::overdueByDate($comp_array, $date);
                    foreach ($overdueInvoices as $key => $value) {
                        $line = str_replace("{invoice_number}", '<a href="'.base_url().'invoices/view/'.$value->id.'">#'.$this->view_data['core_settings']->invoice_prefix.$value->reference.'</a>', $this->lang->line('event_invoice_overdue'));
                        $notification_list[$value->due_date.".".$value->id] = $line;
                    }
                }
                if (in_array("subscriptions", $this->view_data['module_permissions'])) {
                    $outstandingInvoices = Subscription::newInvoiceOutstanding($comp_array, $date);
                    foreach ($outstandingInvoices as $key2 => $value2) {
                        $eventline = str_replace("{subscription_number}", '<a href="'.base_url().'subscriptions/view/'.$value2->id.'">#'.$this->view_data['core_settings']->subscription_prefix.$value2->reference.'</a>', $this->lang->line('event_subscription_new_invoice'));
                        $notification_list[$value2->next_payment.".".$value2->id] = $eventline;
                    }
                }

                if (in_array("projects", $this->view_data['module_permissions'])) {
                    $overdueProjects = Project::overdueByDate($this->user->id, $comp_array, $date);
                    //task notification
                    $this->view_data['projects_icon'] = true;
                    $this->view_data['task_notifications'] = ProjectHasTask::find('all', array('conditions' => array('user_id = ? AND tracking != ?', $this->user->id, 0)));
                    foreach ($overdueProjects as $key2 => $value2) {
                        if ($this->user->admin == 0) {
                            $sql = "SELECT id FROM `project_has_workers` WHERE project_id = ".$value->id." AND user_id = ".$this->user->id;
                            $res = Project::find_by_sql($sql);
                            //$res = $query;
                            if ($res) {
                                $eventline = str_replace("{project_number}", '<a href="'.base_url().'projects/view/'.$value2->id.'">#'.$this->view_data['core_settings']->project_prefix.$value2->reference.'</a>', $this->lang->line('event_project_overdue'));
                                $notification_list[$value2->end.".".$value2->id] = $eventline;
                            }
                        } else {
                            $eventline = str_replace("{project_number}", '<a href="'.base_url().'projects/view/'.$value2->id.'">#'.$this->view_data['core_settings']->project_prefix.$value2->reference.'</a>', $this->lang->line('event_project_overdue'));
                            $notification_list[$value2->end.".".$value2->id] = $eventline;
                        }
                    }
                }

                krsort($notification_list);
                $this->view_data["notification_list"] = $notification_list;
                $this->view_data["notification_count"] = count($notification_list);
            } else {
                $this->theme_view = 'application_client';
                $access = $this->client->access;
                $access = explode(",", $access);
                $email = 'c'.$this->client->id;
                $this->view_data['menu'] = Module::find('all', array('order' => 'sort asc', 'conditions' => array('id in (?) AND type = ?', $access, 'client')));
                $update = Client::find($this->client->id);
                $this->view_data['estimates_new'] = Invoice::find_by_sql("select count(id) as amount from invoices where (`estimate_status`='Sent' or `estimate_status`='Revised') and company_id =".$this->client->company_id);
            }

            //Update user last active
            $update->last_active = time();
            $update->save();

            $this->view_data['messages_new'] = Privatemessage::find_by_sql("select count(id) as amount from privatemessages where `status`='New' AND recipient = '".$email."'");
        }

        /*$this->load->database();
        $sql = "select * FROM templates WHERE type='notes'";
        $query = $this->db->query($sql); */
        $this->view_data["note_templates"] = "";//$query->result();

        /* save current url */
        $url = explode('/', $this->uri->uri_string());
        $no_link = array('login', 'register', 'logout', 'language', 'forgotpass', 'postmaster', 'cronjob', 'agent', 'api');
        if (!in_array($this->uri->uri_string(), $no_link) && empty($_POST) && (!isset($url[1]) || $url[1] == "view")) {
            $link = '/'.$this->uri->uri_string();
            $cookie = array(
                       'name'   => 'fc2_link',
                       'value'  => $link,
                       'expire' => '500',
                   );

            $this->input->set_cookie($cookie);
        }
    }
    
    public function _output($output)
    {
        // set the default content view
        if ($this->content_view !== false && empty($this->content_view)) {
            $this->content_view = $this->router->class . '/' . $this->router->method;
        }
        //render the content view
        $yield = file_exists(APPPATH . 'views/' . $this->view_data['core_settings']->template . '/' . $this->content_view . EXT) ? $this->load->view($this->view_data['core_settings']->template . '/' . $this->content_view, $this->view_data, true) : false;

        //render the theme
        if ($this->theme_view) {
            echo $this->load->view($this->view_data['core_settings']->template . '/' .'theme/' . $this->theme_view, array('yield' => $yield), true);
        } else {
            echo $yield;
        }

        echo $output;
    }
}

class Admin_Controller extends MY_Controller
{
    var $permission = array();

    public function __construct()
    {
        parent::__construct();

        $group_data = array();
        if(empty($this->session->userdata('logged_in'))) {
            $session_data = array('logged_in' => FALSE);
            $this->session->set_userdata($session_data);
        }
        else {
            $user_id = $this->session->userdata('id');
            $this->load->model('model_groups');
            $group_data = $this->model_groups->getUserGroupByUserId($user_id);

            $this->data['user_permission'] = unserialize($group_data['permission']);
            $this->permission = unserialize($group_data['permission']);
        }
    }

    public function logged_in()
    {
        $session_data = $this->session->userdata();
        if($session_data['logged_in'] == TRUE) {
            redirect('dashboard', 'refresh');
        }
    }

    public function not_logged_in()
    {
        $session_data = $this->session->userdata();
        if($session_data['logged_in'] == FALSE) {
            redirect('auth/login', 'refresh');
        }
    }

    public function render_template($page = null, $data = array())
    {

        $this->load->view('blueline/siparis/header',$data);
//        $this->load->view('templates/header_menu',$data);
//        $this->load->view('templates/side_menubar',$data);
        $this->load->view($page, $data);
//        $this->load->view('templates/footer',$data);
    }

    public function company_currency()
    {
        $this->load->model('model_company');
        $company_currency = $this->model_company->getCompanyData(1);
        $currencies = $this->currency();

        $currency = '';
        foreach ($currencies as $key => $value) {
            if($key == $company_currency['currency']) {
                $currency = $value;
            }
        }

        return $currency;

    }


    public function currency()
    {
        return $currency_symbols = array(
            'AED' => '&#1583;.&#1573;', // ?
            'AFN' => '&#65;&#102;',
            'ALL' => '&#76;&#101;&#107;',
            'ANG' => '&#402;',
            'AOA' => '&#75;&#122;', // ?
            'ARS' => '&#36;',
            'AUD' => '&#36;',
            'AWG' => '&#402;',
            'AZN' => '&#1084;&#1072;&#1085;',
            'BAM' => '&#75;&#77;',
            'BBD' => '&#36;',
            'BDT' => '&#2547;', // ?
            'BGN' => '&#1083;&#1074;',
            'BHD' => '.&#1583;.&#1576;', // ?
            'BIF' => '&#70;&#66;&#117;', // ?
            'BMD' => '&#36;',
            'BND' => '&#36;',
            'BOB' => '&#36;&#98;',
            'BRL' => '&#82;&#36;',
            'BSD' => '&#36;',
            'BTN' => '&#78;&#117;&#46;', // ?
            'BWP' => '&#80;',
            'BYR' => '&#112;&#46;',
            'BZD' => '&#66;&#90;&#36;',
            'CAD' => '&#36;',
            'CDF' => '&#70;&#67;',
            'CHF' => '&#67;&#72;&#70;',
            'CLP' => '&#36;',
            'CNY' => '&#165;',
            'COP' => '&#36;',
            'CRC' => '&#8353;',
            'CUP' => '&#8396;',
            'CVE' => '&#36;', // ?
            'CZK' => '&#75;&#269;',
            'DJF' => '&#70;&#100;&#106;', // ?
            'DKK' => '&#107;&#114;',
            'DOP' => '&#82;&#68;&#36;',
            'DZD' => '&#1583;&#1580;', // ?
            'EGP' => '&#163;',
            'ETB' => '&#66;&#114;',
            'EUR' => '&#8364;',
            'FJD' => '&#36;',
            'FKP' => '&#163;',
            'GBP' => '&#163;',
            'GEL' => '&#4314;', // ?
            'GHS' => '&#162;',
            'GIP' => '&#163;',
            'GMD' => '&#68;', // ?
            'GNF' => '&#70;&#71;', // ?
            'GTQ' => '&#81;',
            'GYD' => '&#36;',
            'HKD' => '&#36;',
            'HNL' => '&#76;',
            'HRK' => '&#107;&#110;',
            'HTG' => '&#71;', // ?
            'HUF' => '&#70;&#116;',
            'IDR' => '&#82;&#112;',
            'ILS' => '&#8362;',
            'INR' => '&#8377;',
            'IQD' => '&#1593;.&#1583;', // ?
            'IRR' => '&#65020;',
            'ISK' => '&#107;&#114;',
            'JEP' => '&#163;',
            'JMD' => '&#74;&#36;',
            'JOD' => '&#74;&#68;', // ?
            'JPY' => '&#165;',
            'KES' => '&#75;&#83;&#104;', // ?
            'KGS' => '&#1083;&#1074;',
            'KHR' => '&#6107;',
            'KMF' => '&#67;&#70;', // ?
            'KPW' => '&#8361;',
            'KRW' => '&#8361;',
            'KWD' => '&#1583;.&#1603;', // ?
            'KYD' => '&#36;',
            'KZT' => '&#1083;&#1074;',
            'LAK' => '&#8365;',
            'LBP' => '&#163;',
            'LKR' => '&#8360;',
            'LRD' => '&#36;',
            'LSL' => '&#76;', // ?
            'LTL' => '&#76;&#116;',
            'LVL' => '&#76;&#115;',
            'LYD' => '&#1604;.&#1583;', // ?
            'MAD' => '&#1583;.&#1605;.', //?
            'MDL' => '&#76;',
            'MGA' => '&#65;&#114;', // ?
            'MKD' => '&#1076;&#1077;&#1085;',
            'MMK' => '&#75;',
            'MNT' => '&#8366;',
            'MOP' => '&#77;&#79;&#80;&#36;', // ?
            'MRO' => '&#85;&#77;', // ?
            'MUR' => '&#8360;', // ?
            'MVR' => '.&#1923;', // ?
            'MWK' => '&#77;&#75;',
            'MXN' => '&#36;',
            'MYR' => '&#82;&#77;',
            'MZN' => '&#77;&#84;',
            'NAD' => '&#36;',
            'NGN' => '&#8358;',
            'NIO' => '&#67;&#36;',
            'NOK' => '&#107;&#114;',
            'NPR' => '&#8360;',
            'NZD' => '&#36;',
            'OMR' => '&#65020;',
            'PAB' => '&#66;&#47;&#46;',
            'PEN' => '&#83;&#47;&#46;',
            'PGK' => '&#75;', // ?
            'PHP' => '&#8369;',
            'PKR' => '&#8360;',
            'PLN' => '&#122;&#322;',
            'PYG' => '&#71;&#115;',
            'QAR' => '&#65020;',
            'RON' => '&#108;&#101;&#105;',
            'RSD' => '&#1044;&#1080;&#1085;&#46;',
            'RUB' => '&#1088;&#1091;&#1073;',
            'RWF' => '&#1585;.&#1587;',
            'SAR' => '&#65020;',
            'SBD' => '&#36;',
            'SCR' => '&#8360;',
            'SDG' => '&#163;', // ?
            'SEK' => '&#107;&#114;',
            'SGD' => '&#36;',
            'SHP' => '&#163;',
            'SLL' => '&#76;&#101;', // ?
            'SOS' => '&#83;',
            'SRD' => '&#36;',
            'STD' => '&#68;&#98;', // ?
            'SVC' => '&#36;',
            'SYP' => '&#163;',
            'SZL' => '&#76;', // ?
            'THB' => '&#3647;',
            'TJS' => '&#84;&#74;&#83;', // ? TJS (guess)
            'TMT' => '&#109;',
            'TND' => '&#1583;.&#1578;',
            'TOP' => '&#84;&#36;',
            'TRY' => '&#8356;', // New Turkey Lira (old symbol used)
            'TTD' => '&#36;',
            'TWD' => '&#78;&#84;&#36;',
            'UAH' => '&#8372;',
            'UGX' => '&#85;&#83;&#104;',
            'USD' => '&#36;',
            'UYU' => '&#36;&#85;',
            'UZS' => '&#1083;&#1074;',
            'VEF' => '&#66;&#115;',
            'VND' => '&#8363;',
            'VUV' => '&#86;&#84;',
            'WST' => '&#87;&#83;&#36;',
            'XAF' => '&#70;&#67;&#70;&#65;',
            'XCD' => '&#36;',
            'XPF' => '&#70;',
            'YER' => '&#65020;',
            'ZAR' => '&#82;',
            'ZMK' => '&#90;&#75;', // ?
            'ZWL' => '&#90;&#36;',
        );
    }
}