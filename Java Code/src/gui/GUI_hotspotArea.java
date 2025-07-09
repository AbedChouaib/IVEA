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
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSlider;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.ToolTipManager;
import javax.swing.UIManager;
import javax.swing.border.BevelBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import org.json.JSONException;

import com.uniSaarland_CIPMM.ivea.Dopamine;
import com.uniSaarland_CIPMM.ivea.ReadWriteManager;
import com.uniSaarland_CIPMM.ivea.gui.IVEAsetup.ImportType;

import ij.IJ;
import ij.ImageJ;
import ij.ImagePlus;
import ij.WindowManager;
import ij.gui.Roi;
import ij.plugin.FolderOpener;
import ij.plugin.PlugIn;
import loci.plugins.BF;

public class GUI_hotspotArea extends JFrame implements PlugIn
{
	private static GUI_hotspotArea instance;

	public static GUI_hotspotArea getInstance()
	{
		if (instance == null)
		{
			instance = new GUI_hotspotArea();
		}
		return instance;
	}

	private static final long serialVersionUID = 1L;
	private JFrame frmIvea;
	private JTextField NoiseFilterRadiusF;
	private JTextField SelectionEnlargmentF;
	private JTextField SearchRadiusF;
	private JTextField SavePathF;
	private JTextField ImportF;
	private JLabel TopStatusLabel;
	// private boolean FrameAIisOff = false;
	private JTextField StartF;
	private JTextField EndF;
	private String ImportDirPath, SaveDirPath;
	private boolean ImageDetected = false;
	private String roiMaskPath, ImagesSpotsPath, CSVfilesPath;
//	private int[] MaskCropValues = { 0, 0, 0, 0 };

	private boolean SaveButtonGaurd = true;
	private ImagePlus OriginalImp = new ImagePlus();
	private Color FocusColor;
	private ArrayList<String> StackDirectories = new ArrayList<>();

	private static int StackNumber;

	private Checkbox ChechBoxMultiVideos = new Checkbox();

	static final String Version = "IVEA Plugin Version 1.0";
	static String AnalysisMode = "0";
	static int Mode = 0;
	static boolean lockSwitch = false;
	static String configPath;

	static boolean lockMaskBut = false;

	IVEAsetup.ImportType DataType;
	private JTextField BrightAdjt;
	private String CurrentTime;

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
				GUI_hotspotArea window = GUI_hotspotArea.getInstance();
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
				GUI_hotspotArea window = GUI_hotspotArea.getInstance();
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
	public void initialize() throws JSONException
	{
		if (!IVEAsetup.isEmulator)
		{
			ReadWriteManager RWM = new ReadWriteManager();
			IVEAsetup.IVEA_src_dir = RWM.getIVEAresourcesDir();
		}
		IVEAsetup.loadConfig(IVEAsetup.IVEA_src_dir);
		// <<<<<<<<<<>>>>>>>>>> GUI JFrame <<<<<<<<<<>>>>>>>>>>
		IVEAsetup.username = System.getProperty("user.home"); // get the user.name
		frmIvea = new JFrame();
		frmIvea.setResizable(false);
		frmIvea.getContentPane().setBackground(SystemColor.control);
		frmIvea.setTitle(" Hotsopt Area Analysis");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		frmIvea.setIconImage(mainWindowIcon.getImage());

		frmIvea.setBounds(100, 100, 635, 475);
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
		OptionPanel.setBounds(478, 25, 141, 403);
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
		StartButton.setBounds(32, 349, 89, 23);
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

		CtrlTab.setBounds(10, 90, 458, 338);
		frmIvea.getContentPane().add(CtrlTab);

		JPanel panel_Dopamine = new JPanel();
		CtrlTab.addTab("", panel_Dopamine);
		panel_Dopamine.setLayout(null);

		// ========================== #Region Panels ==========================
		JPanel panel = new JPanel();
		panel.setBounds(6, 205, 434, 96);
		panel_Dopamine.add(panel);
		panel.setBorder(new BevelBorder(BevelBorder.LOWERED, null, null, null, null));
		panel.setBackground(UIManager.getColor("Button.background"));
		panel.setLayout(null);

		JLabel cropMask = new JLabel("Area to learn from");
		cropMask.setBounds(10, 10, 153, 24);
		panel.add(cropMask);

		JButton CreateMaskButton = new JButton("Create mask");
		CreateMaskButton.setEnabled(false);
		CreateMaskButton.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseClicked(MouseEvent arg0)
			{
				Thread OpenCropMaskWindow = new Thread(() ->
				{
					try
					{
						if (!lockMaskBut)
						{
							lockMaskBut = true;
							CreateMaskSelection();
						}
					} catch (Exception e)
					{
						e.printStackTrace();
					}
				});
				OpenCropMaskWindow.start();
			}
		});
		CreateMaskButton.setBounds(155, 12, 120, 24);
		panel.add(CreateMaskButton);

		// CropMaskListGUI.add("0,0,0,0");
		IVEAsetup.CropMaskListGUI.setBounds(290, 14, 136, 24);
		panel.add(IVEAsetup.CropMaskListGUI);

		JButton AdvSet_Dopmaine = new JButton("Advance settings");
		AdvSet_Dopmaine.addMouseListener(new MouseAdapter()
		{
			@Override
			public void mouseReleased(MouseEvent e)
			{
				IVEAsetup.showDialog_Dopamine();
			}
		});
		AdvSet_Dopmaine.setBounds(10, 47, 136, 23);
		panel.add(AdvSet_Dopmaine);

		JPanel PanelSR = new JPanel();
		PanelSR.setBounds(6, 138, 434, 54);
		panel_Dopamine.add(PanelSR);
		PanelSR.setBorder(null);
		PanelSR.setLayout(null);

		JSlider sliderSimpleRatio = new JSlider();
		sliderSimpleRatio.setMaximum(150);
		sliderSimpleRatio.setBounds(156, 11, 200, 31);
		sliderSimpleRatio.setValue((int) (IVEAsetup.BrightnessAdjust * 100));
		sliderSimpleRatio.setToolTipText("");
		sliderSimpleRatio.setSnapToTicks(true);
		sliderSimpleRatio.setPaintTicks(true);
		sliderSimpleRatio.setMinorTickSpacing(2);
		sliderSimpleRatio.setMajorTickSpacing(10);
		PanelSR.add(sliderSimpleRatio);
		sliderSimpleRatio.addChangeListener(new ChangeListener()
		{
			public void stateChanged(ChangeEvent e)
			{
				double temp = (double) (sliderSimpleRatio.getValue()) / 100;
				BrightAdjt.setText("" + temp);
			}
		});

		BrightAdjt = new JTextField("" + IVEAsetup.BrightnessAdjust);
		BrightAdjt.setBounds(366, 16, 45, 25);
		PanelSR.add(BrightAdjt);
		BrightAdjt.setEditable(false);
		BrightAdjt.setHorizontalAlignment(SwingConstants.CENTER);
		BrightAdjt.setColumns(10);

		JLabel lblBrightdarkFilter = new JLabel("Brightness adjustment");
		lblBrightdarkFilter.setBounds(10, 18, 136, 24);
		PanelSR.add(lblBrightdarkFilter);

		JLabel SliderLabelAdaptThresh_1 = new JLabel("  0                0.5                 1                1.5");
		SliderLabelAdaptThresh_1.setBounds(156, 40, 210, 14);
		PanelSR.add(SliderLabelAdaptThresh_1);

		JPanel PanelFields = new JPanel();
		PanelFields.setBounds(6, 11, 434, 118);
		panel_Dopamine.add(PanelFields);

		JLabel lbldefault_3 = new JLabel("(pixel)");

		JLabel lblNoiseFilterRadius = new JLabel("Noise filter radius (default,8)");

		NoiseFilterRadiusF = new JTextField("" + IVEAsetup.noiseFilterRadius);
		NoiseFilterRadiusF.setHorizontalAlignment(SwingConstants.CENTER);
		NoiseFilterRadiusF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				NoiseFilterRadiusF.setBackground(FocusColor);
			}

			@Override
			public void focusLost(FocusEvent e)
			{
				NoiseFilterRadiusF.setBackground(Color.white);
			}
		});
		NoiseFilterRadiusF.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyTyped(KeyEvent e)
			{
				char c = e.getKeyChar();
				if (!Character.isDigit(c) || c == KeyEvent.VK_BACK_SPACE || c == KeyEvent.VK_DELETE)
				{
					e.consume();
				}
			}
		});
		NoiseFilterRadiusF.setColumns(10);

		JLabel label1_5 = new JLabel("Selection enlargment");

		SelectionEnlargmentF = new JTextField("1");
		SelectionEnlargmentF.setHorizontalAlignment(SwingConstants.CENTER);
		SelectionEnlargmentF.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyTyped(KeyEvent e)
			{
				char c = e.getKeyChar();
				if (!Character.isDigit(c) || c == KeyEvent.VK_BACK_SPACE || c == KeyEvent.VK_DELETE)
				{
					e.consume();
				}
			}
		});
		SelectionEnlargmentF.setColumns(10);
		SelectionEnlargmentF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				SelectionEnlargmentF.setBackground(FocusColor);
			}

			@Override
			public void focusLost(FocusEvent e)
			{
				SelectionEnlargmentF.setBackground(Color.white);
			}
		});

		JLabel lbldefault_6 = new JLabel("(pixel)");

		JLabel label1_2 = new JLabel("Event center search radius");

		SearchRadiusF = new JTextField("" + IVEAsetup.SearchRadius);
		SearchRadiusF.setHorizontalAlignment(SwingConstants.CENTER);
		SearchRadiusF.addKeyListener(new KeyAdapter()
		{
			@Override
			public void keyTyped(KeyEvent e)
			{
				char c = e.getKeyChar();
				if (!Character.isDigit(c) || c == KeyEvent.VK_BACK_SPACE || c == KeyEvent.VK_DELETE)
				{
					e.consume();
				}
			}
		});
		SearchRadiusF.setColumns(10);
		SearchRadiusF.addFocusListener(new FocusAdapter()
		{
			@Override
			public void focusGained(FocusEvent arg0)
			{
				SearchRadiusF.setBackground(FocusColor);
			}

			@Override
			public void focusLost(FocusEvent e)
			{
				SearchRadiusF.setBackground(Color.white);
			}
		});

		JLabel lbldefault_8 = new JLabel("(pixel)");
		GroupLayout gl_PanelFields = new GroupLayout(PanelFields);
		gl_PanelFields.setHorizontalGroup(gl_PanelFields.createParallelGroup(Alignment.LEADING).addGroup(gl_PanelFields
				.createSequentialGroup().addContainerGap()
				.addGroup(gl_PanelFields.createParallelGroup(Alignment.TRAILING)
						.addComponent(lblNoiseFilterRadius, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 181, GroupLayout.PREFERRED_SIZE)
						.addComponent(label1_2, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 175, GroupLayout.PREFERRED_SIZE)
						.addComponent(label1_5, Alignment.LEADING, GroupLayout.PREFERRED_SIZE, 175, GroupLayout.PREFERRED_SIZE))
				.addGap(31)
				.addGroup(gl_PanelFields.createParallelGroup(Alignment.TRAILING).addComponent(NoiseFilterRadiusF, 0, 0, Short.MAX_VALUE)
						.addComponent(SearchRadiusF, 0, 0, Short.MAX_VALUE)
						.addComponent(SelectionEnlargmentF, GroupLayout.PREFERRED_SIZE, 41, GroupLayout.PREFERRED_SIZE))
				.addGap(18)
				.addGroup(gl_PanelFields.createParallelGroup(Alignment.LEADING)
						.addComponent(lbldefault_6, GroupLayout.PREFERRED_SIZE, 153, GroupLayout.PREFERRED_SIZE)
						.addComponent(lbldefault_3, GroupLayout.PREFERRED_SIZE, 153, GroupLayout.PREFERRED_SIZE)
						.addComponent(lbldefault_8, GroupLayout.PREFERRED_SIZE, 153, GroupLayout.PREFERRED_SIZE))));
		gl_PanelFields.setVerticalGroup(gl_PanelFields.createParallelGroup(Alignment.LEADING).addGroup(gl_PanelFields
				.createSequentialGroup().addContainerGap().addGroup(
						gl_PanelFields
								.createParallelGroup(Alignment.LEADING).addGroup(gl_PanelFields.createParallelGroup(Alignment.TRAILING)
										.addGroup(gl_PanelFields.createSequentialGroup()
												.addComponent(lbldefault_6, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)
												.addGap(35))
										.addGroup(gl_PanelFields.createSequentialGroup()
												.addComponent(NoiseFilterRadiusF, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE)
												.addGap(10)
												.addComponent(SelectionEnlargmentF, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
														GroupLayout.PREFERRED_SIZE)
												.addGap(13)
												.addGroup(gl_PanelFields.createParallelGroup(Alignment.BASELINE)
														.addComponent(SearchRadiusF, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE,
																GroupLayout.PREFERRED_SIZE)
														.addComponent(lbldefault_8, GroupLayout.PREFERRED_SIZE, 24,
																GroupLayout.PREFERRED_SIZE)))
										.addGroup(
												gl_PanelFields.createSequentialGroup()
														.addComponent(lbldefault_3, GroupLayout.PREFERRED_SIZE, 24,
																GroupLayout.PREFERRED_SIZE)
														.addGap(67)))
								.addGroup(gl_PanelFields.createSequentialGroup()
										.addComponent(lblNoiseFilterRadius, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)
										.addGap(10).addComponent(label1_5, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)
										.addGap(13).addComponent(label1_2, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)))
				.addContainerGap(12, Short.MAX_VALUE)));
		PanelFields.setLayout(gl_PanelFields);

		JPanel panel_TCVF = new JPanel();
		panel_TCVF.setLayout(null);

		JPanel PanelFields_1 = new JPanel();
		PanelFields_1.setBounds(10, 11, 434, 115);
		panel_TCVF.add(PanelFields_1);

		JLabel label1_2_1 = new JLabel("ROI radius");
		label1_2_1.setBounds(9, 12, 200, 24);

		JLabel lbldefault_8_1 = new JLabel("(pixels)");
		lbldefault_8_1.setBounds(288, 12, 136, 24);

		JLabel lblOutputMeasurement = new JLabel("Measurements window");
		lblOutputMeasurement.setBounds(10, 72, 165, 24);

		JLabel label1_2_1_1 = new JLabel("Patch size");
		label1_2_1_1.setBounds(9, 42, 200, 24);
		PanelFields_1.add(label1_2_1_1);

		JLabel lbldefault_8_1_1 = new JLabel("(pixels)");
		lbldefault_8_1_1.setBounds(288, 42, 136, 24);
		PanelFields_1.add(lbldefault_8_1_1);

		JButton AdvSet_Dopmaine_1 = new JButton("Advance settings");
		AdvSet_Dopmaine_1.setBounds(10, 259, 133, 23);
		panel_TCVF.add(AdvSet_Dopmaine_1);

		Checkbox Checkbox_FusionType2 = new Checkbox("Detect events without cloud");
		Checkbox_FusionType2.setBounds(19, 142, 334, 23);
		panel_TCVF.add(Checkbox_FusionType2);
		Checkbox_FusionType2.setState(IVEAsetup.SecretionCtrl);

		Checkbox Checkbox_tinyFusion = new Checkbox("Detect small/weak events (prone to noise)");
		Checkbox_tinyFusion.setBounds(19, 171, 334, 23);
		panel_TCVF.add(Checkbox_tinyFusion);
		Checkbox_tinyFusion.setState(IVEAsetup.tinyFusion);

		Checkbox_FusionType2.addItemListener(new ItemListener()
		{
			public void itemStateChanged(ItemEvent e)
			{
				IVEAsetup.SecretionCtrl = Checkbox_FusionType2.getState();
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

							IVEAsetup.fixedCurrentTime = CurrentTime;
							// ------------------ end ------------------
							IVEAsetup.BrightnessAdjust = (double) (sliderSimpleRatio.getValue()) / 100;
							IVEAsetup.noiseFilterRadius = Integer.parseInt(NoiseFilterRadiusF.getText());
							IVEAsetup.SelectionEnlarge = Integer.parseInt(SelectionEnlargmentF.getText());
							IVEAsetup.SearchRadius = Integer.parseInt(SearchRadiusF.getText());
							IVEAsetup.SaveInSameDir = IVEAsetup.ImagePresent ? false : Checkbox_SaveAsInput.getState();
							// ------------------ end -----------------
							try
							{
								IVEAsetup.saveConfig(IVEAsetup.IVEA_src_dir);
							} catch (JSONException e)
							{
								e.printStackTrace();
							}
//							IVEAsetup.SavePrefs();
							if (!IVEAsetup.MultiImageDetected && IVEAsetup.ImagePresent)
							{
								IVEAsetup.NumberOfStacks = 1;
								Dopamine cl = new Dopamine(OriginalImp);
								cl.run(null);

							} else
							{
								IVEAsetup.NumberOfStacks = StackDirectories.size();
								Dopamine dop = new Dopamine(StackDirectories, 0);
								dop.run(null);

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
				IVEAsetup.CropMaskListValues.clear();
				IVEAsetup.CropMaskListGUI.removeAll();
				StackDirectories.clear();
				StackNumber = 0;
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
//								StartFrameNoteL.setVisible(false);
								CreateMaskButton.setEnabled(false);
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
						CreateMaskButton.setEnabled(true);
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
					CreateMaskButton.setEnabled(true);
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

	public void CreateMaskSelection() throws Exception
	{
		if (ImageDetected)
		{
			if (IVEAsetup.MultiImageDetected)
			{
				if (IVEAsetup.CropMaskListGUI.getSelectedIndex() >= 0)
				{
					StackNumber = IVEAsetup.CropMaskListGUI.getSelectedIndex();
				} else
				{
					StackNumber = 0;
				}
				try
				{
					GetMaskSelection(true);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			} else
			{
				StackNumber = 0;
				try
				{
					GetMaskSelection(true);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		}
	}

//============================================== Mask Creation Window ==============================================
	public void GetMaskSelection(boolean ImageChecker) throws Exception
	{
		if (ImageChecker)
		{
			if (!IVEAsetup.ImagePresent)
			{
				IJ.showStatus("Opening next video please wait...");
				if (IVEAsetup.TheInputIsVideos)
				{
					if (StackDirectories.get(StackNumber).endsWith(".tf2"))
					{
						ImagePlus[] imps = BF.openImagePlus(StackDirectories.get(StackNumber));
						OriginalImp = imps[0];
					} else
					{
						OriginalImp = IJ.openImage(StackDirectories.get(StackNumber));
					}
				} else
				{
					OriginalImp = FolderOpener.open(StackDirectories.get(StackNumber), "virtual");

				}
				OriginalImp.show();
			}
		}
		// -------------------- Check if the user changed something --------------------
		int userInTemp = IVEAsetup.CropMaskListValues.get(StackNumber)[4];
		if (userInTemp == 0)
		{
			InputData indata = new InputData();
			int[] Values2 = indata.GetCropMaskPosition(OriginalImp, 0);
			IVEAsetup.CropMaskListValues.set(StackNumber, Values2);
			IVEAsetup.CropMaskListGUI.add(Values2[0] + "," + Values2[1] + "," + Values2[2] + "," + Values2[3]);
			IVEAsetup.UpdateCropMaskListGUI();
		}
		// -------------------- End --------------------
		IJ.setTool("rectangle");
		JFrame CropMaskWindow = new JFrame();
		CropMaskWindow.toFront();
		CropMaskWindow.requestFocus();
		frmIvea.setEnabled(false);
		CropMaskWindow.setTitle("Crop Mask Window");

		ClassLoader cl = this.getClass().getClassLoader();
		ImageIcon mainWindowIcon = new ImageIcon(cl.getResource("IVEA_logo_x128.png"));
		frmIvea.setIconImage(mainWindowIcon.getImage());

		CropMaskWindow.setResizable(false);
		CropMaskWindow.setBounds(100, 100, 350, 160);
		CropMaskWindow.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		CropMaskWindow.getContentPane().setLayout(null);
		CropMaskWindow.setLocationRelativeTo(null);

		JButton DoneButton = new JButton("Close");
		DoneButton.setBounds(245, 101, 89, 23);
		CropMaskWindow.getContentPane().add(DoneButton);

		JButton NextButton = new JButton("Next");
		NextButton.setBounds(166, 67, 89, 23);
		CropMaskWindow.getContentPane().add(NextButton);

		JTextField CropppingValue = new JTextField();
		CropppingValue.setEditable(false);
		CropppingValue.setBounds(108, 36, 103, 20);
		CropMaskWindow.getContentPane().add(CropppingValue);
		CropppingValue.setColumns(10);

		int[] Values = IVEAsetup.CropMaskListValues.get(StackNumber);
		CropppingValue.setText(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
		OriginalImp.setRoi(Values[0], Values[1], Values[2], Values[3]);

		JButton PreviousButton = new JButton("Previous");
		PreviousButton.setBounds(67, 67, 89, 23);
		CropMaskWindow.getContentPane().add(PreviousButton);

		JButton btnForceToAll = new JButton("Force to all");
		btnForceToAll.setBounds(10, 101, 100, 23);
		CropMaskWindow.getContentPane().add(btnForceToAll);

		JButton SelectButton = new JButton("Retrieve");
		SelectButton.setBounds(224, 35, 89, 23);
		CropMaskWindow.getContentPane().add(SelectButton);

		JLabel lblNewLabel = new JLabel("Create a crop mask selection to retrieve it.");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNewLabel.setBounds(10, 11, 269, 14);
		CropMaskWindow.getContentPane().add(lblNewLabel);
		CropMaskWindow.setVisible(true);
		if (StackNumber == 0)
		{
			PreviousButton.setEnabled(false);
		}
		if (StackDirectories.size() > 0)
		{
			if (StackNumber == StackDirectories.size() - 1)
			{
				NextButton.setEnabled(false);
			}
		} else
		{
			NextButton.setEnabled(false);
			btnForceToAll.setEnabled(false);
		}

		SelectButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				Roi TempRoi = OriginalImp.getRoi();
				if (TempRoi != null)
				{
					Double RoiX = TempRoi.getXBase();
					Double RoiY = TempRoi.getYBase();
					Double _W = TempRoi.getFloatWidth();
					Double _H = TempRoi.getFloatHeight();
					OriginalImp.deleteRoi();
					int[] Values = { (int) Math.floor(RoiX), (int) Math.floor(RoiY), (int) Math.floor(_W), (int) Math.floor(_H), 1 };
					IVEAsetup.CropMaskListValues.set(StackNumber, Values);
					CropppingValue.setText(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
					if (ImageChecker)
					{
						if (!IVEAsetup.ImagePresent)
						{
							OriginalImp.changes = false;
							OriginalImp.close();
						}
					}
					CropMaskWindow.dispose();
					if (StackDirectories.size() > 0)
					{
						StackNumber++;
						if (StackNumber < StackDirectories.size())
						{
							try
							{
								GetMaskSelection(true);
							} catch (Exception e)
							{
								e.printStackTrace();
							}
						} else if (StackNumber == StackDirectories.size())
						{
							frmIvea.setEnabled(true);
							lockMaskBut = false;
							IVEAsetup.UpdateCropMaskListGUI();
						}
					} else
					{
						frmIvea.setEnabled(true);
						lockMaskBut = false;
						IVEAsetup.UpdateCropMaskListGUI();
					}
				} else
				{
					IJ.showMessage("Make sure there is a selection!");
				}
			}
		});

		NextButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				StackNumber++;
				OriginalImp.changes = false;
				OriginalImp.close();
				CropMaskWindow.dispose();
				if (StackNumber < StackDirectories.size())
				{
					try
					{
						GetMaskSelection(true);
					} catch (Exception e)
					{
						e.printStackTrace();
					}
				}
			}
		});
		PreviousButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				StackNumber--;
				OriginalImp.changes = false;
				OriginalImp.close();
				CropMaskWindow.dispose();
				if (StackNumber >= 0)
				{
					try
					{
						GetMaskSelection(true);
					} catch (Exception e)
					{
						e.printStackTrace();
					}
				}
			}
		});
		DoneButton.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent e)
			{
				IVEAsetup.UpdateCropMaskListGUI();
				OriginalImp.deleteRoi();
				if (ImageChecker)
				{
					OriginalImp.changes = false;
					OriginalImp.close();
				}
				lockMaskBut = false;
				CropMaskWindow.dispose();
				frmIvea.setEnabled(true);
			}
		});
		btnForceToAll.addActionListener(new ActionListener()
		{
			@Override
			public void actionPerformed(ActionEvent arg0)
			{
				Roi TempRoi = OriginalImp.getRoi();
				if (TempRoi != null)
				{
					Double RoiX = TempRoi.getXBase();
					Double RoiY = TempRoi.getYBase();
					Double _W = TempRoi.getFloatWidth();
					Double _H = TempRoi.getFloatHeight();
					int[] Values = { (int) Math.floor(RoiX), (int) Math.floor(RoiY), (int) Math.floor(_W), (int) Math.floor(_H), 1 };
					CropppingValue.setText(Values[0] + "," + Values[1] + "," + Values[2] + "," + Values[3]);
					for (int i = 0; i < IVEAsetup.CropMaskListValues.size(); i++)
					{
						IVEAsetup.CropMaskListValues.set(i, Values);
					}
					IVEAsetup.UpdateCropMaskListGUI();
				} else
				{
					IJ.showMessage("Make sure there is a selection to force it to all stacks!");
				}
			}
		});
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
