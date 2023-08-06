#pragma once
#include<QString>
#include<QObject>
#include<QString>
#include <QtQml/qqmlregistration.h>
#include <QClipboard>
#include <QGuiApplication>

//foo namespace to force the linker to link the backing library composed only of qml files
namespace fooDesign 
{
	QString fooPrint(void);
};

class TextClipboard :public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString  text MEMBER m_text NOTIFY textChanged)
    QML_ELEMENT

public:
    TextClipboard(QObject *parent = nullptr):QObject(parent),m_text(QString()),clipboard(QGuiApplication::clipboard())
    {

    }
    Q_INVOKABLE void copy()const
    {
        clipboard->setText(m_text);
    }
signals:
    void textChanged();

public:
    QString m_text;
    QClipboard *clipboard;
};
