package com.uniSaarland_CIPMM.ivea.gui;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;

import javax.swing.JPanel;

class ImagePanel extends JPanel
{
	private static final long serialVersionUID = 1L;
	private BufferedImage image;
	private int width;
	private int height;

	public ImagePanel(BufferedImage image, int width, int height)
	{
		this.image = image;
		this.width = width;
		this.height = height;
		setPreferredSize(new Dimension(width, height));
	}

	@Override
	protected void paintComponent(Graphics g)
	{
		super.paintComponent(g);

		BufferedImage resizedImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g2d = resizedImg.createGraphics();
		g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g2d.drawImage(image, 0, 0, width, height, null);
		g2d.dispose();

		g.drawImage(resizedImg, 0, 0, this);
	}
}