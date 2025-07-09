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

import com.uniSaarland_CIPMM.ivea.FixedFBEs;
import com.uniSaarland_CIPMM.ivea.ReadWriteManager;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup.ImportType;

import ij.IJ;
import ij.ImageJ;
import ij.ImagePlus;
import ij.WindowManager;
import ij.plugin.FolderOpener;
import ij.plugin.PlugIn;

public class GUI_fixedFBEs extends JFrame implements PlugIn
{
	private static GUI_fixedFBEs instance;

	public static GUI_fixedFBEs getInstance()
	{
		if (instance == null)
		{
			instance = new GUI_fixedFBEs();
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
	private boolean neurons = true;
	// ============ Metadata ============
	public double[] Resolution = { 0, 0, 0 };
	public int nChannels = 1;
//			private int zSlices;
	public int nFrames;
	public double tempResolution;

	// ============ end ============

	IVEAsetup.ImportType DataType;
	private String CurrentTime;
	private JTextField txtF_movingMIP;
	private JTextField txtF_SynapseMaskRadius;
	private JTextField input_Stim1Period;
	public String[] Local_SBEmodels = { "C:\\Users\\Abed\\PycharmProjects\\LSTM (s,t,f)\\lstmModel_Neurons_v5.6Fc",
				"E:\\IVEA Analysis\\T-Cells\\Training_outputv3_refine\\eViT_stationary_tf2.10.1-v_2",
				"E:\\IVEA Analysis\\T-Cells\\Training_outputv3\\eViT_nFixed_tf2.10.1-v_8" };

	// main method will not be called inside ImageJ, Java editors testing only!
	// Hope this could would help you to build your new ImageJ plugin, Good Luck! :)
	public static void main(String[] args) throws Exception
	{

		System.setProperty("ij.dir", "C:\\Users\\Abed\\Programs\\Fiji.app\\");
		System.setProperty("plugins.dir", "C:\\Users\\Abed\\Programs\\Fiji.app\\Plugins");
		new ImageJ();
		IVEAsetup.isEmulator = true;
		EventQueue.invokeLater(() ->
		{
			try
			{
				GUI_fixedFBEs window = GUI_fixedFBEs.getInstance();
				window.initialize();
				window.frmIvea.setVisible(true);
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		});
	}

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
				GUI_fixedFBEs window = GUI_fixedFBEs.getInstance();
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
//		IVEAsetup.LoadPrefs();
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
			String[] SBE_ModelPath = RWM.getModelPaths(IVEAsetup.SBE_modelsNames[IVEAsetup.SBEmodel_ID]);
			IVEAsetup.Model_Synapse_Path = SBE_ModelPath[0];
		} else
		{
			IVEAsetup.TimeSeriesModel = true;
			IVEAsetup.Model_Synapse_Path = Local_SBEmodels[IVEAsetup.SBEmodel_ID];
		}
		int x_Pos = 10;
		IVEAsetup.getConfigUpdate(IVEAsetup.Model_Synapse_Path, neurons, false); // get JSON config file neural network params
		// <<<<<<<<<<>>>>>>>>>> GUI JFrame <<<<<<<<<<>>>>>>>>>>
		IVEAsetup.username = System.getProperty("user.home"); // get the user.name,
		frmIvea = new JFrame();
		frmIvea.setResizable(false);
		frmIvea.getContentPane().setBackground(SystemColor.control);
		frmIvea.setTitle(" Stationary Burst Event Analysis ");

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
				IVEAsetup.ImagePresent = true;
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
		CtrlTab.setBounds(10, 90, 480, 355);
		frmIvea.getContentPane().add(CtrlTab);
		JPanel panel_params = new JPanel();
		CtrlTab.addTab("", panel_params);
		panel_params.setLayout(null);

		x_Pos = 220;
		JLabel lbldefault_8_1_2 = new JLabel("(pixels, default 5)");
		lbldefault_8_1_2.setBounds(x_Pos, 20, 115, 24);
		panel_params.add(lbldefault_8_1_2);

		txtF_SynapseMaskRadius = new JTextField("" + IVEAsetup.SynapseSearchRadius);
		txtF_SynapseMaskRadius.setHorizontalAlignment(SwingConstants.CENTER);
		txtF_SynapseMaskRadius.setColumns(10);
		txtF_SynapseMaskRadius.setBounds(140, 20, 60, 20);
		panel_params.add(txtF_SynapseMaskRadius);

		JLabel label1_2_1_2 = new JLabel("Search radius");
		label1_2_1_2.setBounds(18, 18, 115, 24);
		label1_2_1_2.setToolTipText(
				"<html><b>Search radius</b>:<br>Defines the tracking radius to link vesicle centers across frames. This accounts for vesicle size and movement, i.e., small radius 2->3 pixels for vesicle with small fusion.<br>Unit: pixels.</html>");
		panel_params.add(label1_2_1_2);

		txtF_movingMIP = new JTextField("" + IVEAsetup.SBE_MaxPooling);
		txtF_movingMIP.setHorizontalAlignment(SwingConstants.CENTER);
		txtF_movingMIP.setColumns(10);
		txtF_movingMIP.setBounds(140, 52, 60, 20);
		panel_params.add(txtF_movingMIP);

		JLabel lblTCFVinterval_1 = new JLabel("Temp max pooling");
		lblTCFVinterval_1.setBounds(18, 50, 115, 24);
		lblTCFVinterval_1.setToolTipText(
				"<html><b>Temporal max pooling</b>:<br>This variable will reduce the video by x times using temporal max intensity projection (MIP) (experimental).<br>Unit: integer number.</html>");
		panel_params.add(lblTCFVinterval_1);

		JLabel lbldefault_3_1_2 = new JLabel("(default, 1)");
		lbldefault_3_1_2.setBounds(x_Pos, 50, 115, 24);
		panel_params.add(lbldefault_3_1_2);
		JLabel modelList_title = new JLabel("Models list");
		modelList_title.setBounds(380, 20, 115, 60);
		panel_params.add(modelList_title);

		JList<String> modelList = new JList<>(IVEAsetup.SBE_available_models);
		modelList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		modelList.setVisibleRowCount(3);
		modelList.setSelectedIndex(IVEAsetup.SBEmodel_ID);
		JScrollPane listScrollPane = new JScrollPane(modelList);
		listScrollPane.setBounds(355, 60, 115, 90);

		// Listener to update selectedModel variable
		modelList.addListSelectionListener(e ->
		{
			if (!e.getValueIsAdjusting())
			{
				IVEAsetup.SBEmodel_ID = modelList.getSelectedIndex();
				String RBE_model_name = IVEAsetup.SBE_modelsNames[IVEAsetup.SBEmodel_ID];
				if (IVEAsetup.isEmulator)
				{
					IVEAsetup.Model_Synapse_Path = Local_SBEmodels[IVEAsetup.SBEmodel_ID];
//					System.out.println("Selected model: " + IVEAsetup.Model_Synapse_Path);
				} else
				{
					ReadWriteManager RWM = new ReadWriteManager();
					String[] ModelPaths = RWM.getModelPaths(RBE_model_name);
					IVEAsetup.Model_Synapse_Path = ModelPaths[0];
				}
				IVEAsetup.getConfigUpdate(IVEAsetup.Model_Synapse_Path, neurons, !IVEAsetup.SBE_disableLogFile);
			}
		});
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

				if (!value.equals("NeuroLSTM"))
				{
					setForeground(Color.GRAY);
				} else
				{
					setForeground(isSelected ? list.getSelectionForeground() : list.getForeground());
				}

				return c;
			}
		});
		JPanel panel_stimulation_options = new JPanel();
		panel_stimulation_options.setLayout(null);
		panel_stimulation_options.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		panel_stimulation_options.setBackground(SystemColor.menu);
		panel_stimulation_options.setBounds(5, 160, 450, 165);
		panel_params.add(panel_stimulation_options);

		JButton AdvSet_Neurons = new JButton("Advance settings");
		AdvSet_Neurons.setBounds(5, 120, 150, 25);
		panel_stimulation_options.add(AdvSet_Neurons);

		JPanel Panel_StimNeuron = new JPanel();
		Panel_StimNeuron.setBounds(10, 30, 420, 61);
		panel_stimulation_options.add(Panel_StimNeuron);
		Panel_StimNeuron.setLayout(null);

		JLabel label1_2_1_2_1 = new JLabel("Stimulation/s (0-auto)");
		label1_2_1_2_1.setBounds(10, 0, 127, 24);
		Panel_StimNeuron.add(label1_2_1_2_1);

		input_Stim1Period = new JTextField(IVEAsetup.NeuronStimulations);
		input_Stim1Period.setBounds(147, 3, 153, 20);
		Panel_StimNeuron.add(input_Stim1Period);
		input_Stim1Period.setHorizontalAlignment(SwingConstants.CENTER);
		input_Stim1Period.setColumns(10);

		JLabel lbldefault_8_1_2_1 = new JLabel("Hint: to add new stimulations use \"_\" as add; i.e,: 300-0_1800-2000_...");
		lbldefault_8_1_2_1.setFont(new Font("Tahoma", Font.PLAIN, 11));
		lbldefault_8_1_2_1.setBounds(10, 34, 394, 24);
		Panel_StimNeuron.add(lbldefault_8_1_2_1);

		JLabel lbldefault_8_1_2_1_1 = new JLabel("(frames, from-to)");
		lbldefault_8_1_2_1_1.setBounds(303, 0, 101, 24);
		Panel_StimNeuron.add(lbldefault_8_1_2_1_1);
		AdvSet_Neurons.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
			}
		});
		AdvSet_Neurons.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseReleased(MouseEvent e)
			{
				IVEAsetup.showDialog_Neuron();
			}
		});
		Checkbox CB_StimDetection = new Checkbox("Stimulaltion detection");
		CB_StimDetection.setBounds(10, 2, 150, 25);
		panel_stimulation_options.add(CB_StimDetection);
		CB_StimDetection.setState(IVEAsetup.NeuronStimDetection);

		JButton Measurement_SetNeuron = new JButton("Measurements");
		Measurement_SetNeuron.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
			}
		});
		Measurement_SetNeuron.setBounds(200, 120, 135, 25);
		panel_stimulation_options.add(Measurement_SetNeuron);

		Measurement_SetNeuron.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
			}
		});
		Measurement_SetNeuron.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseReleased(MouseEvent e)
			{
				IVEAsetup.showDialog_NeuronMeasurements();
			}
		});

		CB_StimDetection.addItemListener(new ItemListener()
		{
			public void itemStateChanged(ItemEvent e)
			{
				IVEAsetup.NeuronStimDetection = CB_StimDetection.getState();
				setPanelEnabled(Panel_StimNeuron, IVEAsetup.NeuronStimDetection);
			}
		});
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
		ToolTipManager toolTipManager = ToolTipManager.sharedInstance();
		toolTipManager.setInitialDelay(50); // Show immediately
		toolTipManager.setDismissDelay(10000); // Never dismiss
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
							// ------------------ end ------------------
							// ------------------ Synapse Vesicles Fusion Parameters ------------------
							IVEAsetup.SBE_MaxPooling = Integer.parseInt(txtF_movingMIP.getText());
							IVEAsetup.SBE_MaxPooling = IVEAsetup.SBE_MaxPooling <= 0 ? 1 : (int) IVEAsetup.SBE_MaxPooling;

							IVEAsetup.SynapseSearchRadius = Integer.parseInt(txtF_SynapseMaskRadius.getText());
							// ------------------ end ------------------
							IVEAsetup.SaveInSameDir = IVEAsetup.ImagePresent ? false : Checkbox_SaveAsInput.getState();
							IVEAsetup.NeuronStim1 = IVEAsetup.getIntervalsv2(input_Stim1Period.getText(), IVEAsetup.SP);
							if (IVEAsetup.SBEmodel_ID == 0)
							{
								IVEAsetup.IsLSTM_SBE = true;
							}
							try
							{
								IVEAsetup.saveConfig(IVEAsetup.IVEA_src_dir);
							} catch (JSONException e)
							{
								e.printStackTrace();
							}
							// ------------------ end -----------------
							if (!IVEAsetup.MultiImageDetected && IVEAsetup.ImagePresent)
							{
								IVEAsetup.NumberOfStacks = 1;
								FixedFBEs NSY = new FixedFBEs(OriginalImp);
								NSY.run(null);

							} else
							{
								IVEAsetup.NumberOfStacks = StackDirectories.size();
								FixedFBEs fixed = new FixedFBEs(StackDirectories, 0);
								fixed.run(null);

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
						IVEAsetup.ImagePresent = false;
						ImageDetected = true;
						IVEAsetup.MultiImageDetected = false;
						StartFrameLabel.setEnabled(true);
						EndFrameLabel.setEnabled(true);
						StartF.setEnabled(true);
						EndF.setEnabled(true);
						StartF.setText("2");
						EndF.setText(Integer.toString(IVEAsetup.StackLength));
						TopStatusLabel.setText("Images stack loaded successfully!");
					}
				});
				GetValues.start();
			}
		});
		// ====================== Search for Images ======================
		// ====================== Search for Images ======================
		if (IVEAsetup.ImagePresent)
		{
			try
			{
				IVEAsetup.StackLength = OriginalImp.getNSlices();
				if (IVEAsetup.StackLength >= 3)
				{
					StartFrameLabel.setEnabled(true);
					EndFrameLabel.setEnabled(true);
					StartF.setEnabled(true);
					EndF.setEnabled(true);
					StartF.setText("2");
					EndF.setText(Integer.toString(IVEAsetup.StackLength));
					InputData indata = new InputData();
					int[] Values = indata.GetCropMaskPosition(OriginalImp, 1);
					IVEAsetup.CropMaskListValues.add(Values);
					IVEAsetup.CropMaskListGUI.removeAll();
					IVEAsetup.CropMaskListGUI.add(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
					TopStatusLabel.setText("Image stack detected. If its not what you want! please import a new stack!");
				}
			} catch (Exception e)
			{
				IVEAsetup.ImagePresent = false;
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
}
