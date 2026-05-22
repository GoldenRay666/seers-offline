.class public Lcom/taomee/pwdlogin/service/LoginRecordObject;
.super Ljava/lang/Object;
.source "LoginRecordObject.java"


# instance fields
.field private isRemember:Ljava/lang/String;

.field private pwd:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getIsRemember()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->isRemember:Ljava/lang/String;

    return-object v0
.end method

.method public getPwd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->pwd:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 8
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setIsRemember(Ljava/lang/String;)V
    .locals 0
    .param p1, "isRemember"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->isRemember:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public setPwd(Ljava/lang/String;)V
    .locals 0
    .param p1, "pwd"    # Ljava/lang/String;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->pwd:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 11
    iput-object p1, p0, Lcom/taomee/pwdlogin/service/LoginRecordObject;->userName:Ljava/lang/String;

    .line 12
    return-void
.end method
