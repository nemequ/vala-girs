[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKA
{
	public const ulong LABEL;
	public const ulong VALUE;
	public const ulong ID;
	public const ulong CLASS;
	public const ulong CERTIFICATE_CATEGORY;
	public const ulong MODIFIABLE;
	public const ulong MODULUS_BITS;
	public const ulong KEY_TYPE;
	public const ulong TOKEN;
}

[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKS
{
	public const ulong RW_USER_FUNCTIONS;
	public const ulong RO_USER_FUNCTIONS;
	public const ulong RW_SO_FUNCTIONS;
}

[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKF
{
	public const ulong WRITE_PROTECTED;
	public const ulong LOGIN_REQUIRED;
	public const ulong USER_PIN_INITIALIZED;
}

[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKO
{
	public const ulong CERTIFICATE;
	public const ulong PRIVATE_KEY;
}

[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKU
{
	public const ulong USER;
}

[CCode (cheader_filename = "p11-kit/pkcs11.h")]
namespace CKR
{
	public const ulong OBJECT_HANDLE_INVALID;
}
