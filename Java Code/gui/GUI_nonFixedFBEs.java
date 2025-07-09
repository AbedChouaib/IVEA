package com.uniSaarland_CIPMM.ivea.gui;

/*<IVEA is an ImageJ plugIn developed to detect and analyze bright events in videos>
Copyright (C) <2024>  <Abed H. Chouaib>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License v3 as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License v3 for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
import java.awt.Checkbox;
import java.awt.Color;
import java.awt.Component;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.SystemColor;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.swing.DefaultListCellRenderer;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.SwingConstants;
import javax.swing.ToolTipManager;
import javax.swing.border.BevelBorder;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import org.json.JSONException;

import com.uniSaarland_CIPMM.ivea.NonFixedFBEs;
import com.uniSaarland_CIPMM.ivea.ReadWriteManager;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup.ImportType;

import ij.IJ;
import ij.ImageJ;
import ij.ImagePlus;
import ij.WindowManager;
import ij.plugin.FolderOpener;
import ij.plugin.PlugIn;

public class GUI_nonFixedFBEs extends JFrame implements PlugIn
{
	private static GUI_nonFixedFBEs instance;

	public static GUI_nonFixedFBEs getInstance()
	{
		if (instance == null)
		{
			instance = new GUI_nonFixedFBEs();
		}
		return instance;
	}

	private static final long serialVersionUID = 1L;
	private JFrame frmIvea;
	private JTextField SavePathF;
	private JTextField ImportF;
	private JLabel TopStatusLabel;
	private JTextField StartF;
	private JTextField EndF;
	private String ImportDirPath, SaveDirPath;
	private boolean ImageDetected = false;
	private String roiMaskPath, ImagesSpotsPath, CSVfilesPath;
	private static boolean ImagePresent = false;

	private boolean SaveButtonGaurd = true;
	private ImagePlus OriginalImp = new ImagePlus();
	private Color FocusColor;
	private ArrayList<String> StackDirectories = new ArrayList<>();

	private Checkbox ChechBoxMultiVideos = new Checkbox();

	static final String Version = "IVEA Plugin Version 1.0";
	static String AnalysisMode = "0";
	static int Mode = 0;
	static boolean lockSwitch = false;
	static String configPath;

	static boolean lockMaskBut = false;
	boolean neurons = false;
	// ============ Metadata ============
	public double[] Resolution = { 0, 0, 0 };
	public int nChannels = 1;
	public int nFrames;
	public double tempResolution;
	// ============ end ============

	IVEAsetup.ImportType DataType;
	private String CurrentTime;
	private JTextField txtF_searchRadius;
	private JTextField txtF_maxPooling;
	private JTextField txtF_measurementInterval;
	private JTextField network_radius_infield;
	public String[] Local_RBEmodels = { "E:\\IVEA Analysis\\T-Cells\\Training_outputv3\\eViT_nFixed_tf2.10.1-v_8",
				"E:\\IVEA Analysis\\T-Cells\\Training_outputv2\\eTrans_nFixed_tf2.9.1-v_35",
				"C:\\Users\\Abed\\PycharmProjects\\LSTM (s,t,f)\\lstmModel_TCell_tf2.9.1-v1.3TC" };


	// ==================================================================================================
	// ==================================================================================================

	// ============================= Run IVEA ===============================
	// ============================= Run IVEA ===============================
	public void run(String arg)
	{
		EventQueue.invokeLater(() ->
		{
			try
			{
				GUI_nonFixedFBEs window = GUI_nonFixedFBEs.getInstance();
				window.initialize();
				window.frmIvea.setVisible(true);
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		});
	}

	// ============================= Run IVEA ===============================
	// ============================= Run IVEA ===============================

	// <<<<<<<<<<>>>>>>>>>> GUI JFrame <<<<<<<<<<>>>>>>>>>>
	public void initialize()
	{
		if (!IVEAsetup.isEmulator)
		{
			ReadWriteManager RWM = new ReadWriteManager();
			IVEAsetup.IVEA_src_dir = RWM.getIVEAresourcesDir();
		}
		try
		{
			IVEAsetup.loadConfig(IVEAsetup.IVEA_src_dir);
		} catch (JSONException e)
		{
			e.printStackTrace();
		}

		if (!IVEAsetup.isEmulator)
		{
			ReadWriteManager RWM = new ReadWriteManager();
			String[] ModelPaths = RWM.getModelPaths(IVEAsetup.RBE_modelsNames[IVEAsetup.RBEmodel_ID]);
			if (IVEAsetup.UseCustomModel)
			{
				IVEAsetup.Selected_model_ran_path = IVEAsetup.ModelDirectory;
			} else
			{
				IVEAsetup.Selected_model_ran_path = ModelPaths[0];
			}
		} else
		{
			IVEAsetup.Selected_model_ran_path = Local_RBEmodels[IVEAsetup.RBEmodel_ID];
		}
		int y_pos = 10; // to group control y grid coordinates.
		IVEAsetup.getConfigUpdate(IVEAsetup.Selected_model_ran_path, neurons, false); // get JSON config file neural network params
		// <<<<<<<<<<>>>>>>>>>> GUI JFrame <<<<<<<<<<>>>>>>>>>>
		// -------------------- Loading Parameters --------------------
		// -------------------- end --------------------
		IVEAsetup.username = System.getProperty("user.home"); // get the user.name
		frmIvea = new JFrame();
		frmIvea.setResizable(false);
		frmIvea.getContentPane().setBackground(SystemColor.control);
		frmIvea.setTitle(" Random Burst Event Analysis ");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		frmIvea.setIconImage(mainWindowIcon.getImage());

		frmIvea.setBounds(100, 100, 650, 495);
		frmIvea.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		frmIvea.getContentPane().setLayout(null);
		frmIvea.setLocationRelativeTo(null);
		FocusColor = Color.decode("#ddeeff"); // #eeddff
		try
		{
			OriginalImp = WindowManager.getCurrentImage();
			if (OriginalImp != null)
			{
				IVEAsetup.SubFolderNameList.add(OriginalImp.getTitle());
				ImageDetected = true;
				ImagePresent = true;
			} else
			{
				ImageDetected = false;
			}
		} catch (Exception e)
		{
			ImageDetected = false;
		}

		SavePathF = new JTextField(); // save path
		SavePathF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				SavePathF.setBackground(Color.WHITE);
			}
		});
		if (IVEAsetup.username != null)
		{
			CurrentTime = "" + java.time.LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
			CurrentTime = CurrentTime.replace(":", "");
//			CurrentTime = CurrentTime.replace("-", "");
			CurrentTime = CurrentTime.replace("T", "-T");
			IVEAsetup.InitialSaveName = IVEAsetup.username + File.separator + "Desktop" + File.separator + "IVEA Analysis";
			SavePathF.setText(IVEAsetup.InitialSaveName);
		}
		SavePathF.setToolTipText("");
		SavePathF.setColumns(10);
		SavePathF.setBounds(10, 59, 313, 20);
		frmIvea.getContentPane().add(SavePathF);

		ImportF = new JTextField();
		ImportF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				ImportF.setBackground(Color.WHITE);
			}
		});
		ImportF.setToolTipText("");
		ImportF.setColumns(10);
		ImportF.setBounds(10, 26, 313, 20);
		frmIvea.getContentPane().add(ImportF);

		JButton ImportFolderButton = new JButton("Import ");
		ImportFolderButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				if (DataType == ImportType.Vi)
				{
					ImportDirPath = IJ.getFilePath("Select Input Video...");
					try
					{
						File F = new File(ImportDirPath);
						IVEAsetup.InputPath = F.getParent() + File.separator;

					} catch (Exception e)
					{
						System.out.println("error building input path");
					}
				} else
				{
					ImportDirPath = IJ.getDirectory("Select Input Folder...");
					IVEAsetup.InputPath = ImportDirPath;
				}
				if (ImportDirPath != null)
				{
					ImportF.setText(ImportDirPath);
				}
			}
		});
		ImportFolderButton.setBounds(343, 25, 89, 23);
		frmIvea.getContentPane().add(ImportFolderButton);

		JPanel OptionPanel = new JPanel();
		OptionPanel.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		OptionPanel.setBounds(495, 25, 140, 420);
		frmIvea.getContentPane().add(OptionPanel);
		OptionPanel.setLayout(null);

		TopStatusLabel = new JLabel("No images stack detected, please import new image stack/s!");
		TopStatusLabel.setFont(new Font("Tahoma", Font.PLAIN, 10));
		TopStatusLabel.setForeground(SystemColor.textHighlight);
		TopStatusLabel.setBounds(10, 0, 412, 24);
		frmIvea.getContentPane().add(TopStatusLabel);

		JButton SaveButton = new JButton("Save");
		SaveButton.setBounds(343, 58, 89, 23);
		frmIvea.getContentPane().add(SaveButton);

		SaveButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				SaveDirPath = IJ.getDirectory("Select OutPut Folder...");
				if (SaveDirPath != null)
				{
					SavePathF.setText(SaveDirPath);
					IVEAsetup.OutPutDirectory = SaveDirPath;
					SaveButtonGaurd = false;
				}
			}
		});
		// ========================== #Region Declarations ==========================

		JButton StartButton = new JButton("Start");
		StartButton.setBounds(32, 380, 90, 23);
		OptionPanel.add(StartButton);

		BufferedImage img = null;
		try
		{
			img = ImageIO.read(cl.getResource("IVEA_logo_x128rec.png"));
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		if (img != null)
		{
			int imgWidth = 100;
			int imgHeight = (int) (img.getHeight(null) * ((double) imgWidth / img.getWidth(null))); // Maintain aspect ratio
			int xPos = (OptionPanel.getWidth() - imgWidth) / 2; // Center horizontally
			int yPos = StartButton.getY() - imgHeight - 30; // 20 pixels above the start button

			ImagePanel imagePanel = new ImagePanel(img, imgWidth, imgHeight);
			imagePanel.setBounds(xPos, yPos, imgWidth, imgHeight);
			OptionPanel.add(imagePanel);
		}

		Checkbox CheckBoxImages = new Checkbox("Image sequence");
		CheckBoxImages.setBounds(10, 68, 121, 23);
		OptionPanel.add(CheckBoxImages);

		ChechBoxMultiVideos = new Checkbox("Video directory");
		ChechBoxMultiVideos.setBounds(10, 39, 121, 23);
		OptionPanel.add(ChechBoxMultiVideos);

		Checkbox CheckBoxOneVideo = new Checkbox("Video");
		CheckBoxOneVideo.setBounds(10, 10, 121, 23);
		OptionPanel.add(CheckBoxOneVideo);

		DataType = IVEAsetup.getDataType(CheckBoxOneVideo, ChechBoxMultiVideos, CheckBoxImages);

		Checkbox Checkbox_SaveAsInput = new Checkbox("");
		Checkbox_SaveAsInput.setState(true);
		Checkbox_SaveAsInput.setBounds(10, 97, 19, 23);
		OptionPanel.add(Checkbox_SaveAsInput);

		JLabel lbldefault_6_1 = new JLabel("<html>Save results in input directory</html>");
		lbldefault_6_1.setBounds(32, 97, 99, 34);
		OptionPanel.add(lbldefault_6_1);

		EndF = new JTextField();
		EndF.setBounds(56, 223, 65, 20);
		OptionPanel.add(EndF);
		EndF.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyTyped(KeyEvent evt)
			{
				char c = evt.getKeyChar();
				if (!Character.isDigit(c) || c == KeyEvent.VK_BACK_SPACE || c == KeyEvent.VK_DELETE)
				{
					evt.consume();
				}
			}
		});
		EndF.setEnabled(false);
		EndF.setColumns(10);

		JLabel EndFrameLabel = new JLabel("End");
		EndFrameLabel.setBounds(10, 221, 41, 24);
		OptionPanel.add(EndFrameLabel);
		EndFrameLabel.setEnabled(false);

		StartF = new JTextField();
		StartF.setBounds(56, 192, 65, 20);
		OptionPanel.add(StartF);
		StartF.setEnabled(false);
		StartF.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyTyped(KeyEvent evt)
			{
				char c = evt.getKeyChar();
				if (!Character.isDigit(c) || c == KeyEvent.VK_BACK_SPACE || c == KeyEvent.VK_DELETE)
				{
					evt.consume();
				}
			}
		});
		StartF.setColumns(10);

		JLabel StartFrameLabel = new JLabel("Start");
		StartFrameLabel.setBounds(10, 191, 50, 23);
		OptionPanel.add(StartFrameLabel);
		StartFrameLabel.setEnabled(false);

		StartF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				StartF.setBackground(FocusColor);
			}

			@Override
			public void focusLost(FocusEvent e)
			{
				StartF.setBackground(Color.white);
			}
		});
		EndF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				EndF.setBackground(FocusColor);
			}

			@Override
			public void focusLost(FocusEvent e)
			{
				EndF.setBackground(Color.white);
			}
		});

		JTabbedPane CtrlTab = new JTabbedPane(JTabbedPane.TOP);

		// ========================== ==========================
		CtrlTab.setBounds(10, 90, 480, 355);
		frmIvea.getContentPane().add(CtrlTab);

		JPanel panel_params = new JPanel();
		CtrlTab.addTab("", panel_params);
		panel_params.setLayout(null);

		JPanel PanelFields_1 = new JPanel();
		PanelFields_1.setBounds(10, 11, 434, 135);
		panel_params.add(PanelFields_1);

		// ================ Vision radius ================
		y_pos = 12;
		JLabel label_PatchSize = new JLabel("**Vision radius**");
		label_PatchSize.setBounds(9, y_pos, 200, 24);
		label_PatchSize.setToolTipText(
				"<html><b>Vision radius</b>:<br>Defines the regions (patch size) surrounding "
						+ "an event for which the neural network will visualize. This value will directly"
						+ " impact the classification results, minimum value is 6<br>Unit: pixels.</html>");
		PanelFields_1.add(label_PatchSize);

		network_radius_infield = new JTextField("" + IVEAsetup.nFixedNetwork_Radius);
		network_radius_infield.setHorizontalAlignment(SwingConstants.CENTER);
		network_radius_infield.setColumns(10);
		network_radius_infield.setBounds(219, y_pos + 4, 60, 19);
		PanelFields_1.add(network_radius_infield);
		JLabel lbldefault_8_1 = new JLabel("(pixels)");
		lbldefault_8_1.setBounds(295, y_pos, 150, 24);

		// ================ Search radius ================
		y_pos = 42;
		JLabel label_ROIradius = new JLabel("*Search radius*");
		label_ROIradius.setBounds(9, y_pos, 200, 24);
		label_ROIradius.setToolTipText(
				"<html><b>Search radius</b>:<br>Defines the tracking radius to link vesicle"
						+ " centers across frames. This accounts for vesicle size and movement, i.e., "
						+ "small radius 2->3 pixels for vesicle with small fusion.<br>Unit: pixels.</html>");
		txtF_searchRadius = new JTextField("" + IVEAsetup.nonfixedRadius);
		txtF_searchRadius.setBounds(219, y_pos + 4, 60, 19);
		txtF_searchRadius.setHorizontalAlignment(SwingConstants.CENTER);
		txtF_searchRadius.setColumns(10);

		JLabel lbldefault_8_1_1 = new JLabel("(pixels)");
		lbldefault_8_1_1.setBounds(295, y_pos, 150, 24);
		PanelFields_1.add(lbldefault_8_1_1);

		// ================ Max pooling ================
		y_pos = 72;
		JLabel label_maxpooling = new JLabel("Temp max pooling");
		label_maxpooling.setBounds(9, y_pos, 200, 24);
		label_maxpooling.setToolTipText(
				"<html><b>Temporal max pooling</b>:<br>This variable will reduce the video by x times using temporal max intensity projection (MIP).<br>Unit: integer number.</html>");
		txtF_maxPooling = new JTextField("" + IVEAsetup.RBE_MaxPooling);
		txtF_maxPooling.setBounds(219, y_pos + 4, 60, 19);
		txtF_maxPooling.setHorizontalAlignment(SwingConstants.CENTER);
		txtF_maxPooling.setColumns(10);

		JLabel label_maxpooling_unit = new JLabel("(default, 1)");
		label_maxpooling_unit.setBounds(295, y_pos, 150, 24);
		PanelFields_1.add(label_maxpooling);
		PanelFields_1.add(txtF_maxPooling);
		PanelFields_1.add(label_maxpooling_unit);

		// ================ Measurements window ================
		y_pos = 102;
		JLabel label_Measurement = new JLabel("Measurements window");
		label_Measurement.setBounds(10, y_pos, 165, 24);
		label_Measurement.setToolTipText(
				"<html><b>Region radius</b>:<br>Defines the profile intensity of the event "
						+ "at a time interval, this value does not affect detection or classification.<br>Unit: frames.</html>");

		txtF_measurementInterval = new JTextField("");
		txtF_measurementInterval.setBounds(219, y_pos + 4, 60, 19);
		txtF_measurementInterval.setHorizontalAlignment(SwingConstants.CENTER);
		txtF_measurementInterval.setColumns(10);
		txtF_measurementInterval.setText(IVEAsetup.MeasurementInterval);
		JLabel lbldefault_3_1_1 = new JLabel("(before-after) fusion");
		lbldefault_3_1_1.setBounds(295, y_pos, 150, 24);
		// ================ end ================
		PanelFields_1.setLayout(null);
		PanelFields_1.add(label_ROIradius);
		PanelFields_1.add(txtF_searchRadius);
		PanelFields_1.add(lbldefault_8_1);
		PanelFields_1.add(label_Measurement);
		PanelFields_1.add(txtF_measurementInterval);
		PanelFields_1.add(lbldefault_3_1_1);

		JButton AdvSet_Dopmaine_1 = new JButton("Advance settings");
		AdvSet_Dopmaine_1.setBounds(5, 280, 150, 25);
		panel_params.add(AdvSet_Dopmaine_1);

		Checkbox Checkbox_FusionType2 = new Checkbox("Detect events without cloud (class_1)");
		Checkbox_FusionType2.setBounds(19, 160, 260, 23);
		panel_params.add(Checkbox_FusionType2);
		Checkbox_FusionType2.setState(IVEAsetup.SecretionCtrl);

		Checkbox Checkbox_FusionType3 = new Checkbox("Detect latent vesicle fusion (class_2)");
		Checkbox_FusionType3.setBounds(19, 190, 260, 23);
		panel_params.add(Checkbox_FusionType3);
		Checkbox_FusionType3.setState(IVEAsetup.RBE_latentFusion);

		Checkbox Checkbox_tinyFusion = new Checkbox("Detect small/weak events (prone to noise)");
		Checkbox_tinyFusion.setBounds(19, 220, 275, 23);
		panel_params.add(Checkbox_tinyFusion);
		Checkbox_tinyFusion.setState(IVEAsetup.tinyFusion);

		JButton CustomModelTcell = new JButton("Custom model");
		CustomModelTcell.setBounds(190, 280, 150, 25);
		panel_params.add(CustomModelTcell);

		// ==================== Model list ====================
		JLabel modelList_title = new JLabel("Models list");
		modelList_title.setBounds(380, 155, 115, 30);
		panel_params.add(modelList_title);

		JList<String> modelList = new JList<>(IVEAsetup.RBE_available_models);
		modelList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		modelList.setSelectedIndex(IVEAsetup.RBEmodel_ID);
		modelList.setVisibleRowCount(3);
		JScrollPane listScrollPane = new JScrollPane(modelList);
		listScrollPane.setBounds(355, 180, 115, 90);

		// Listener to update selectedModel variable
		modelList.addListSelectionListener(e ->
		{
			if (!e.getValueIsAdjusting())
			{
				IVEAsetup.RBEmodel_ID = modelList.getSelectedIndex();
				String RBE_model_name = IVEAsetup.RBE_modelsNames[IVEAsetup.RBEmodel_ID];
				if (IVEAsetup.isEmulator)
				{
					IVEAsetup.Selected_model_ran_path = Local_RBEmodels[IVEAsetup.RBEmodel_ID];
				} else
				{
					ReadWriteManager RWM = new ReadWriteManager();
					String[] ModelPaths = RWM.getModelPaths(RBE_model_name);
					IVEAsetup.Selected_model_ran_path = ModelPaths[0];
				}
				IVEAsetup.getConfigUpdate(IVEAsetup.Selected_model_ran_path, neurons, !IVEAsetup.RBE_disableLogFile);
			}
		});
		// ==================== Model list ====================
		panel_params.add(listScrollPane);
		modelList.setCellRenderer(new DefaultListCellRenderer()
		{
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Component getListCellRendererComponent(JList<?> list, Object value,
					int index, boolean isSelected, boolean cellHasFocus)
			{

				Component c = super.getListCellRendererComponent(
						list, value, index, isSelected, cellHasFocus);

				if (value.equals("GranuLSTM"))
				{
					setForeground(Color.GRAY);
				} else
				{
					setForeground(isSelected ? list.getSelectionForeground() : list.getForeground());
				}

				return c;
			}
		});
		CustomModelTcell.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseReleased(MouseEvent e)
			{
				IVEAsetup.ShowCustomModelTcell();
			}
		});

		Checkbox_FusionType2.addItemListener(new ItemListener()
		{
			public void itemStateChanged(ItemEvent e)
			{
				IVEAsetup.SecretionCtrl = Checkbox_FusionType2.getState();
			}
		});
		Checkbox_FusionType3.addItemListener(new ItemListener()
		{
			public void itemStateChanged(ItemEvent e)
			{
				IVEAsetup.RBE_latentFusion = Checkbox_FusionType3.getState();
			}
		});
		Checkbox_tinyFusion.addItemListener(new ItemListener()
		{
			public void itemStateChanged(ItemEvent e)
			{
				IVEAsetup.tinyFusion = Checkbox_tinyFusion.getState();
			}
		});
		AdvSet_Dopmaine_1.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
			}
		});
		AdvSet_Dopmaine_1.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseReleased(MouseEvent e)
			{
				IVEAsetup.showDialog_RBE();
			}
		});

		ToolTipManager toolTipManager = ToolTipManager.sharedInstance();
		toolTipManager.setInitialDelay(50); // Show immediately
		toolTipManager.setDismissDelay(10000); // Never dismiss
		// ========================== End ==========================

		CheckBoxOneVideo.addItemListener(e ->
		{
			CheckBoxImages.setState(!CheckBoxOneVideo.getState());
			ChechBoxMultiVideos.setState(!CheckBoxOneVideo.getState());
			IVEAsetup.TheInputIsVideos = CheckBoxOneVideo.getState();
			IVEAsetup.OneVideo = true;
			DataType = IVEAsetup.ImportType.Vi;
			IVEAsetup.ImportTypeCheckbox = 0;
		});

		ChechBoxMultiVideos.addItemListener(e ->
		{
			CheckBoxImages.setState(!ChechBoxMultiVideos.getState());
			CheckBoxOneVideo.setState(!ChechBoxMultiVideos.getState());
			IVEAsetup.TheInputIsVideos = ChechBoxMultiVideos.getState();
			IVEAsetup.OneVideo = false;
			DataType = IVEAsetup.ImportType.MVi;
			IVEAsetup.ImportTypeCheckbox = 1;
		});
		CheckBoxImages.addItemListener(e ->
		{
			ChechBoxMultiVideos.setState(!CheckBoxImages.getState());
			CheckBoxOneVideo.setState(!CheckBoxImages.getState());
			IVEAsetup.TheInputIsVideos = ChechBoxMultiVideos.getState();
			IVEAsetup.OneVideo = false;
			DataType = IVEAsetup.ImportType.ImgS;
			IVEAsetup.ImportTypeCheckbox = 2;
		});
		// ==================== Start Program
		// ====================================================================================
		StartButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				Thread StartProgram = new Thread(() ->
				{
					if (SavePathF.getText() != null && !SavePathF.getText().isEmpty())
					{
						if (ImageDetected)
						{
							frmIvea.dispose();
							if (SaveButtonGaurd)
							{
								if (IVEAsetup.username != null)
								{
									File OutDir = new File(
											IVEAsetup.username + File.separator + "Desktop" + File.separator + "IVEA Analysis"
													+ File.separator);
									if (!OutDir.exists())
									{
										OutDir.mkdir();
									}
								}
								IVEAsetup.OutPutDirectory = SavePathF.getText() + File.separator + IVEAsetup.AnalysisName + " "
										+ CurrentTime;
							}
							RefreshGUI();
							IVEAsetup.StartFrame = Integer.parseInt(StartF.getText());
							IVEAsetup.EndFrame = Integer.parseInt(EndF.getText());
							// ------------------ T-Cell Vesicles Fusion Parameters ------------------
							IVEAsetup.fixedCurrentTime = CurrentTime;
							IVEAsetup.nonfixedRadius = Integer.parseInt(txtF_searchRadius.getText());
							IVEAsetup.RBE_MaxPooling = Integer.parseInt(txtF_maxPooling.getText());
							IVEAsetup.RBE_MaxPooling = IVEAsetup.RBE_MaxPooling <= 0 ? 1 : (int) IVEAsetup.RBE_MaxPooling;
//							IVEAsetup.TCVFMinRad = Integer.parseInt(txtF_TCVFMinRad.getText());
							IVEAsetup.MeasurementInterval = txtF_measurementInterval.getText();
							IVEAsetup.nFixedNetwork_Radius = Integer.parseInt(network_radius_infield.getText());
							// ------------------ end ------------------

							IVEAsetup.SaveInSameDir = ImagePresent ? false : Checkbox_SaveAsInput.getState();
							if (IVEAsetup.RBEmodel_ID == 2)
							{
								IVEAsetup.IsLSTM_RBE = true;
							}
							// ------------------ end -----------------
//							IVEAsetup.SavePrefs();
							try
							{
								IVEAsetup.saveConfig(IVEAsetup.IVEA_src_dir);
							} catch (JSONException e)
							{
								e.printStackTrace();
							}
							if (!IVEAsetup.MultiImageDetected && ImagePresent)
							{
								IVEAsetup.NumberOfStacks = 1;
								NonFixedFBEs RBE = new NonFixedFBEs(OriginalImp);
								RBE.run(null);

							} else
							{
								IVEAsetup.NumberOfStacks = StackDirectories.size();
								NonFixedFBEs RBE = new NonFixedFBEs(StackDirectories, 0);
								RBE.run(null);
							}
						} else
						{
							ImportF.setBackground(Color.decode(IVEAsetup.alertColor));
						}
					} else
					{
						SavePathF.setBackground(Color.decode(IVEAsetup.alertColor));
					}
				});
				StartProgram.start();
			}
		});
		// ========================== #End ==========================

		// ====================== Search for Images ======================
		ImportF.getDocument().addDocumentListener(new DocumentListener()
		{
			public void changedUpdate(DocumentEvent e)
			{
			}

			public void removeUpdate(DocumentEvent e)
			{
			}

			public void insertUpdate(DocumentEvent e)
			{
				changed();
			}

			public void changed()
			{
				StackDirectories.clear();
				TopStatusLabel.setText("Loading data please wait...");
				Thread GetValues = new Thread(() ->
				{
					String ImgsPath = ImportF.getText();
					File CheckPath = new File(ImgsPath);
					if (CheckPath.isDirectory())
					{
						// Get files and update files inputs.
						StackDirectories = IVEAsetup.CheckDirectory(ImgsPath, DataType, OriginalImp);
						if (StackDirectories == null)
						{
							if (!ImageDetected)
							{
								StartFrameLabel.setEnabled(false);
								EndFrameLabel.setEnabled(false);
								StartF.setEnabled(false);
								EndF.setEnabled(false);
								TopStatusLabel.setText("No images stack was detected.");
							}
						} else
						{
							try
							{
								if (!IVEAsetup.TheInputIsVideos)
								{
									OriginalImp = FolderOpener.open(StackDirectories.get(0), "virtual");
									IVEAsetup.StackLength = OriginalImp.getStackSize();
								}
								ImageDetected = true;
								if (StackDirectories.size() == 1)
								{
									IVEAsetup.MultiImageDetected = false;
									TopStatusLabel.setText("Images stack loaded successfully.");
								} else
								{
									IVEAsetup.MultiImageDetected = true;
									TopStatusLabel.setText(StackDirectories.size() + " videos detected.");
								}
								StartF.setText("2");
								StartFrameLabel.setEnabled(!IVEAsetup.MultiImageDetected);
								EndFrameLabel.setEnabled(!IVEAsetup.MultiImageDetected);
								StartF.setEnabled(true);
								EndF.setEnabled(true);
								EndF.setText(Integer.toString(IVEAsetup.StackLength));

							} catch (Exception e)
							{
								ImageDetected = false;
								IVEAsetup.MultiImageDetected = false;
								StartFrameLabel.setEnabled(false);
								EndFrameLabel.setEnabled(false);
								StartF.setEnabled(false);
								EndF.setEnabled(false);
								TopStatusLabel.setText("Nothing detected! please import image sequence/s or video/s.");
							}
						}
					} else if (IVEAsetup.OneVideo)
					{
						StackDirectories = IVEAsetup.CheckDirectory(ImgsPath, DataType, OriginalImp);
						IVEAsetup.SubFolderNameList.add("Null");
						ImagePresent = false;
						ImageDetected = true;
						IVEAsetup.MultiImageDetected = false;
						StartFrameLabel.setEnabled(true);
						EndFrameLabel.setEnabled(true);
						StartF.setEnabled(true);
						EndF.setEnabled(true);
						StartF.setText("2");
						EndF.setText(Integer.toString(IVEAsetup.StackLength));
//						System.out.println("[" + getLineNumber() + "] >>>>>> stack length [" + IVEAsetup.StackLength + "] <<<<<<");
						TopStatusLabel.setText("Images stack loaded successfully!");
					}
				});
				GetValues.start();
			}
		});
		// ====================== Search for Images ======================
		// ====================== Search for Images ======================
		if (ImagePresent)
		{
			try
			{
				IVEAsetup.StackLength = OriginalImp.getStackSize();
				if (IVEAsetup.StackLength >= 3)
				{
					StartFrameLabel.setEnabled(true);
					EndFrameLabel.setEnabled(true);
					StartF.setEnabled(true);
					EndF.setEnabled(true);
					StartF.setText("2");
					EndF.setText(Integer.toString(IVEAsetup.StackLength));
					TopStatusLabel.setText("Image stack detected. If its not what you want! please import a new stack!");
				}
			} catch (Exception e)
			{
				ImagePresent = false;
			}
		}
		frmIvea.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyPressed(KeyEvent evt)
			{
				char c = evt.getKeyChar();
				if (c == KeyEvent.VK_ENTER)
				{
					RefreshGUI();
				}
			}
		});
		frmIvea.getContentPane().addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				RefreshGUI();
			}
		});
		// ==================== Start Program
		// ====================================================================================
	}
	// <<<<<<<<<<>>>>>>>>>> GUI JFrame <<<<<<<<<<>>>>>>>>>>
	// ==================================================================================================
	// ==================================================================================================

	// ================================ #Regions Methods
	// ================================
	private void RefreshGUI()
	{
		String StartFValue = StartF.getText();
		String EndFValue = EndF.getText();
//		String TimeUnitValue = txtF_FPS.getText();

		if (ImageDetected)
		{
			if (StartFValue.equals("") || StartFValue.isEmpty())
			{
				StartF.setText("2");
			} else
			{
				int input = Integer.parseInt(StartFValue);
				if (input < 2)
				{
					StartF.setText("2");
				} else if (input > IVEAsetup.StackLength)
				{
					StartF.setText("" + IVEAsetup.StackLength);
				}
			}
			if (EndFValue.equals("") || EndFValue.isEmpty())
			{
				EndF.setText(Integer.toString(IVEAsetup.StackLength));
			} else
			{
				int input = Integer.parseInt(EndFValue);
				if (input > IVEAsetup.StackLength)
				{
					EndF.setText(Integer.toString(IVEAsetup.StackLength));
				}
			}
		}
	}

	public void CreateDir(String OutPutDirectory)
	{
		roiMaskPath = OutPutDirectory + "/Mask Selection";
		ImagesSpotsPath = OutPutDirectory + "/Image Signals";
		CSVfilesPath = OutPutDirectory + "/Signals Data";
		File roiMaskDirectory = new File(roiMaskPath);
		File imagesDirectoryFile = new File(ImagesSpotsPath);
		File CSVfilesDirectory = new File(CSVfilesPath);
		if (!roiMaskDirectory.exists())
		{
			roiMaskDirectory.mkdir();
		}
		if (!imagesDirectoryFile.exists())
		{
			imagesDirectoryFile.mkdir();
		}
		if (!CSVfilesDirectory.exists())
		{
			CSVfilesDirectory.mkdir();
		}
	}

	public int[] SplitCommaReturn(String str)
	{
		String[] array = str.split(",", 0);
		int[] FinalArray = new int[array.length];
		if (array.length == 4)
		{
			for (int i = 0; i < FinalArray.length; i++)
			{
				try
				{
					FinalArray[i] = Integer.parseInt(array[i]);
				} catch (Exception e)
				{
				}
			}
		}
		return FinalArray;
	}

	public void printLine(String[] data)
	{
		for (int i = 0; i < data.length; i++)
		{
			System.out.println(data[i]);
		}
	}

	public void printLine(ArrayList<String> data)
	{
		for (int i = 0; i < data.size(); i++)
		{
			System.out.println(data.get(i));
		}
	}

//============================================== Mask Creation Window ==============================================

	public void PrintConfigFile(String OutDir, ArrayList<String> LogFile) throws IOException
	{
		FileWriter LogF = new FileWriter(OutDir + "/Log file.txt");

		for (int i = 0; i < LogFile.size(); i++)
		{
			LogF.write(LogFile.get(i) + "\n");
		}
		LogF.close();
	}

	boolean intToBoolean(int state)
	{
		return state != 0;
	}

	void setPanelEnabled(JPanel panel, Boolean isEnabled)
	{
		panel.setEnabled(isEnabled);

		Component[] components = panel.getComponents();

		for (Component component : components)
		{
			if (component instanceof JPanel)
			{
				setPanelEnabled((JPanel) component, isEnabled);
			}
			component.setEnabled(isEnabled);
		}
	}

	public static int getLineNumber()
	{
		return Thread.currentThread().getStackTrace()[2].getLineNumber();
	}
}
