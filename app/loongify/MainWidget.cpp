#include "MainWidget.h"

#include <QMessageBox>
MainWidget::MainWidget(QWidget *parent)
    : QWidget(parent)
{
    QMessageBox msgBox;
     msgBox.setText("The document has been modified.");
     msgBox.setInformativeText("Do you want to save your changes?");
     msgBox.setStandardButtons(QMessageBox::Save | QMessageBox::Discard | QMessageBox::Cancel);
     msgBox.setDefaultButton(QMessageBox::Save);
     int ret = msgBox.exec();

}

MainWidget::~MainWidget()
{
}

